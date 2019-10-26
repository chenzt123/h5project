package com.h5.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * 接口响应封装类
 *
 */
public class RespFormat {

    private boolean success;//是否成功
    private String code;//返回码
    private String msg;//返回信息
    private Object data = new JSONObject();;//返回数据

    public RespFormat() {
    }

    public RespFormat(String code, String msg, boolean success, Object data) {
        this.code = code;
        this.msg = msg;
        this.success = success;
        this.data = data;
    }

    /**
     * 自定义返回结果（特殊情况可用）
     * @param success
     * @param code
     * @param msg
     * @param data
     * @return
     */
    public static RespFormat markCustom(boolean success, String code, String msg, Object data){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(success);
        respEntity.setCode(code);
        respEntity.setMsg(msg);
        respEntity.setData(data);
        return respEntity;
    }

    /**
     * 请求成功,并返回数据
     * @param data
     * @return
     */
    public static RespFormat markSuccess(String msg, Object data){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(true);
        respEntity.setCode(Constants.RespCodes.SUCCESS);
        respEntity.setMsg(msg);
        respEntity.setData(data);
        return respEntity;
    }

    /**
     * 请求成功，未返回数据
     * @param msg
     * @return
     */
    public static RespFormat markSuccess(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(true);
        respEntity.setCode(Constants.RespCodes.SUCCESS);
        respEntity.setMsg(msg);
        return respEntity;
    }

    /**
     * 请求成功,数据填写错误
     * @return
     */
    public  static RespFormat markSuccessAndNoData(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(true);
        respEntity.setCode(Constants.RespCodes.SUCCESS_NOT_RESPONSE_DATA);
        respEntity.setMsg(msg);
        return respEntity;
    }

    /**
     * 服务器遇到错误，无法完成请求
     * @return
     */
    public  static RespFormat markError(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.ERROR);
        respEntity.setMsg(msg);
        return respEntity;
    }

    /**
     * 服务器遇到错误，无法完成请求 自定义code
     * @return
     */
    public  static RespFormat markError(String msg,String code){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(code);
        respEntity.setMsg(msg);
        return respEntity;
    }
    /**
     * 针对第三方接口
     * @return
     */
    public  static RespFormat markError(String msg,Object object){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.ERROR);
        respEntity.setMsg(msg);
        respEntity.setData(object);
        return respEntity;
    }

    /**
     * 针对第三方接口自定义code
     * @return
     */
    public  static RespFormat markError(String msg,Object object,String code){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(code);
        respEntity.setMsg(msg);
        respEntity.setData(object);
        return respEntity;
    }
    /**
     * 服务器遇到错误
     * @return
     */
    public  static RespFormat markError(){
        RespFormat respEntity = new RespFormat();
        respEntity.setCode(Constants.RespCodes.ERROR);
        respEntity.setSuccess(false);
        respEntity.setMsg("服务器遇到错误，无法完成请求");
        return respEntity;
    }

    /**
     * 用户不存在或被禁用
     * @return
     */
    public  static RespFormat markUserNotExistOrForbidden(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.USER_NOT_EXIST_OR_FORBIDDEN);
        respEntity.setMsg(msg);
        return respEntity;
    }

    /**
     * 请求的接口不存在
     * @return
     */
    public  static RespFormat markRequestNotExist(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.REQUEST_NOT_EXIST);
        respEntity.setMsg(msg);
        return respEntity;
    }
    /**
     * 没有接口的访问权限
     * @return
     */
    public  static RespFormat markNoPermission(){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.NO_PERMISSION);
        respEntity.setMsg(Constants.RespCodes.RESP_INFO.get(Constants.RespCodes.NO_PERMISSION));
        return respEntity;
    }
    /**
     * 参数为空或格式错误
     * @return
     */
    public  static RespFormat markParaEmptyOrFormatError(String msg){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.PARA_EMPTY_OR_FORMAT_ERROR);
        respEntity.setMsg(msg);
        return respEntity;
    }
    /**
     * 参数为空或格式错误（重载）
     * @return
     */
    public  static RespFormat markParaEmptyOrFormatError(){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.PARA_EMPTY_OR_FORMAT_ERROR);
        respEntity.setMsg(Constants.RespCodes.RESP_INFO.get(Constants.RespCodes.PARA_EMPTY_OR_FORMAT_ERROR));
        return respEntity;
    }
    /**
     * 非法IP请求
     * @return
     */
    public  static RespFormat markIllegalIp(){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.ILLEGAL_IP);
        respEntity.setMsg(Constants.RespCodes.RESP_INFO.get(Constants.RespCodes.ILLEGAL_IP));
        return respEntity;
    }
    /**
     * 系统异常
     * @return
     */
    public  static RespFormat markSystemException(){
        RespFormat respEntity = new RespFormat();
        respEntity.setSuccess(false);
        respEntity.setCode(Constants.RespCodes.SYSTEM_EXCEPTION);
        respEntity.setMsg(Constants.RespCodes.RESP_INFO.get(Constants.RespCodes.SYSTEM_EXCEPTION));
        return respEntity;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
