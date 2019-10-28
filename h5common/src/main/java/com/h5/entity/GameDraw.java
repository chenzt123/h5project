package com.h5.entity;

import java.util.Date;

public class GameDraw extends GameDrawKey {
    private Date closeTime;

    private String result;

    private Integer drawStatus;

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Integer getDrawStatus() {
        return drawStatus;
    }

    public void setDrawStatus(Integer drawStatus) {
        this.drawStatus = drawStatus;
    }
}