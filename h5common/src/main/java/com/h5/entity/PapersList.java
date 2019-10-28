package com.h5.entity;

import java.util.Date;

public class PapersList {
    private Integer id;

    private String papersName;

    private String firstLetter;

    private Integer status;

    private String remark;

    private Date createTime;

    private Integer picSrcSitecode;

    private String picSrcSitename;

    private String picACode;

    private String picBCode;

    private String picCCode;

    private String picDCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPapersName() {
        return papersName;
    }

    public void setPapersName(String papersName) {
        this.papersName = papersName;
    }

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getPicSrcSitecode() {
        return picSrcSitecode;
    }

    public void setPicSrcSitecode(Integer picSrcSitecode) {
        this.picSrcSitecode = picSrcSitecode;
    }

    public String getPicSrcSitename() {
        return picSrcSitename;
    }

    public void setPicSrcSitename(String picSrcSitename) {
        this.picSrcSitename = picSrcSitename;
    }

    public String getPicACode() {
        return picACode;
    }

    public void setPicACode(String picACode) {
        this.picACode = picACode;
    }

    public String getPicBCode() {
        return picBCode;
    }

    public void setPicBCode(String picBCode) {
        this.picBCode = picBCode;
    }

    public String getPicCCode() {
        return picCCode;
    }

    public void setPicCCode(String picCCode) {
        this.picCCode = picCCode;
    }

    public String getPicDCode() {
        return picDCode;
    }

    public void setPicDCode(String picDCode) {
        this.picDCode = picDCode;
    }
}