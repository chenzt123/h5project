package com.h5.entity;

import java.util.Date;

public class GameDrawOp extends GameDrawOpKey {
    private String result;

    private String resultZodiac;

    private String resultFive;

    private String resultWave;

    private String resultHome;

    private String resultMantissa;

    private Date gameDate;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getResultZodiac() {
        return resultZodiac;
    }

    public void setResultZodiac(String resultZodiac) {
        this.resultZodiac = resultZodiac;
    }

    public String getResultFive() {
        return resultFive;
    }

    public void setResultFive(String resultFive) {
        this.resultFive = resultFive;
    }

    public String getResultWave() {
        return resultWave;
    }

    public void setResultWave(String resultWave) {
        this.resultWave = resultWave;
    }

    public String getResultHome() {
        return resultHome;
    }

    public void setResultHome(String resultHome) {
        this.resultHome = resultHome;
    }

    public String getResultMantissa() {
        return resultMantissa;
    }

    public void setResultMantissa(String resultMantissa) {
        this.resultMantissa = resultMantissa;
    }

    public Date getGameDate() {
        return gameDate;
    }

    public void setGameDate(Date gameDate) {
        this.gameDate = gameDate;
    }
}