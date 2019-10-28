package com.h5.entity;

import java.util.Date;

public class PapersPicture {
    private Integer id;

    private String drawId;

    private Integer papersId;

    private String papersName;

    private String firstLetter;

    private String pictureAUrl;

    private String pictureBUrl;

    private String pictureCUrl;

    private String pictureDUrl;

    private Date uploadTime;

    private Date publishTime;

    private Integer status;

    private String operId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDrawId() {
        return drawId;
    }

    public void setDrawId(String drawId) {
        this.drawId = drawId;
    }

    public Integer getPapersId() {
        return papersId;
    }

    public void setPapersId(Integer papersId) {
        this.papersId = papersId;
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

    public String getPictureAUrl() {
        return pictureAUrl;
    }

    public void setPictureAUrl(String pictureAUrl) {
        this.pictureAUrl = pictureAUrl;
    }

    public String getPictureBUrl() {
        return pictureBUrl;
    }

    public void setPictureBUrl(String pictureBUrl) {
        this.pictureBUrl = pictureBUrl;
    }

    public String getPictureCUrl() {
        return pictureCUrl;
    }

    public void setPictureCUrl(String pictureCUrl) {
        this.pictureCUrl = pictureCUrl;
    }

    public String getPictureDUrl() {
        return pictureDUrl;
    }

    public void setPictureDUrl(String pictureDUrl) {
        this.pictureDUrl = pictureDUrl;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOperId() {
        return operId;
    }

    public void setOperId(String operId) {
        this.operId = operId;
    }
}