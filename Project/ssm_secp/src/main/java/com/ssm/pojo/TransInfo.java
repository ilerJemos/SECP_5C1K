package com.ssm.pojo;

public class TransInfo {
    private Long infoid;

    private String typeinfo;

    private Integer typeid;

    private String fromadd;

    private Double fromx;

    private Double fromy;

    private String toadd;

    private Double tox;

    private Double toy;

    private String istotal;

    private Integer num;

    private Double weight;

    public Long getInfoid() {
        return infoid;
    }

    public void setInfoid(Long infoid) {
        this.infoid = infoid;
    }

    public String getTypeinfo() {
        return typeinfo;
    }

    public void setTypeinfo(String typeinfo) {
        this.typeinfo = typeinfo == null ? null : typeinfo.trim();
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getFromadd() {
        return fromadd;
    }

    public void setFromadd(String fromadd) {
        this.fromadd = fromadd == null ? null : fromadd.trim();
    }

    public Double getFromx() {
        return fromx;
    }

    public void setFromx(Double fromx) {
        this.fromx = fromx;
    }

    public Double getFromy() {
        return fromy;
    }

    public void setFromy(Double fromy) {
        this.fromy = fromy;
    }

    public String getToadd() {
        return toadd;
    }

    public void setToadd(String toadd) {
        this.toadd = toadd == null ? null : toadd.trim();
    }

    public Double getTox() {
        return tox;
    }

    public void setTox(Double tox) {
        this.tox = tox;
    }

    public Double getToy() {
        return toy;
    }

    public void setToy(Double toy) {
        this.toy = toy;
    }

    public String getIstotal() {
        return istotal;
    }

    public void setIstotal(String istotal) {
        this.istotal = istotal == null ? null : istotal.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }
}