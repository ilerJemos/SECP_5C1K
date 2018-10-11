import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pylab as plt

# 数据读取


def read_data_save(filepath1, filepath2, filepath3, filepath4):
    data1 = pd.read_csv(filepath1, encoding='utf-8', low_memory=False)
    data2 = pd.read_csv(filepath2, encoding='utf-8', low_memory=False)
    data3 = data2.drop('日期', axis=1)
    data = data1.append(data3)
    # print(type(data))
    # print(data.shape)
    # print(data.head())

    data.to_csv(filepath3, sep=',', header=True, index=False)

    data = data.drop('品名', 1)
    data = data.drop('品名代码', 1)
    data = data.drop('发送城市', 1)
    data = data.drop('到达城市', 1)
    data = data.drop('物流总包', 1)
    data = data.drop('车数', 1)
    data.to_csv(filepath4, sep=',', header=True, index=False)


# 聚类分析
def Kmeansfenxi(filepath):
    outputFilepath = 'E:\WorkSpaceOfPython\DataAnalysis\output.csv'
    outputFilepath2 = 'E:\WorkSpaceOfPython\DataAnalysis\outputTure.csv'
    k = 15  # 需要进行的聚类类别数
    iteration = 500  # 聚类最大循环数

    # 读取数据
    data = pd.read_csv(filepath, encoding='gbk', low_memory=False)

    # 调用K-means进行聚类分析
    kmodel = KMeans(n_clusters=k, n_jobs=4)
    kmodel.fit(data)

    r1 = pd.Series(kmodel.labels_).value_counts()  # 统计各个类别的数目

    r2 = pd.DataFrame(kmodel.cluster_centers_)  # 找出聚类中心
    r = pd.concat([r2, r1], axis=1)  # 横向连接（0是纵向），得到聚类中心对应的类别下的数目

    # 详细输出每个样本对应的类别
    s = pd.concat([data, pd.Series(kmodel.labels_, index=data.index)], axis=1)
    s.columns = list(data.columns) + [u'聚类类别']  # 重命名表头
    s.to_csv(outputFilepath)  # 保存分类结果

    r.columns = list(data.columns) + [u'聚类类别']  # 重命名表头
    group_by_type = s.groupby(u'聚类类别')
    r3 = group_by_type[['吨数']].sum()
    r3.rename(columns={'吨数': '总吨数'}, inplace=True)
    r = pd.concat([r, r3['总吨数']], axis=1)

    r = r.drop('吨数', axis=1)
    r = r.drop('聚类类别', axis=1)
    r.to_csv(outputFilepath2)
    print(r)


def main():

    read_data_save(r'E:\WorkSpaceOfPython\DataAnalysis\FilteredData.csv',
                   r'E:\WorkSpaceOfPython\DataAnalysis\AddDate.csv',
                   r'E:\WorkSpaceOfPython\DataAnalysis\data_cleaned.csv',
                   r'E:\WorkSpaceOfPython\DataAnalysis\data_deleted.csv')

    Kmeansfenxi(r'E:\WorkSpaceOfPython\DataAnalysis\data_deleted.csv')


if __name__ == '__main__':
    main()
