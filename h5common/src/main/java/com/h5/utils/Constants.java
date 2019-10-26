package com.h5.utils;


import java.util.HashMap;
import java.util.Map;

public class Constants {

    /**
     * 返回码
     */
    public static final class RespCodes{
        /**  服务器已成功处理请求，并无异常 */
        public static final String SUCCESS = "0000";
        /**  服务器已成功处理请求，返回异常 */
        public static final String SUCCESS_NOT_RESPONSE_DATA = "0001";
        /**  服务器遇到错误，无法完成请求 */
        public static final String ERROR = "0002";

        /**  服务器遇到错误，无法完成请求 */
        public static final String THREE_ERROR = "0002";
        /**  用户不存在或被禁用 */
        public static final String USER_NOT_EXIST_OR_FORBIDDEN= "1000";
        /**  请求的接口不存在 */
        public static final String REQUEST_NOT_EXIST = "1001";
        /**  没有接口的访问权限 */
        public static final String NO_PERMISSION = "1002";
        /**  参数为空或格式错误 */
        public static final String PARA_EMPTY_OR_FORMAT_ERROR = "1003";
        /**  非法IP请求 */
        public static final String ILLEGAL_IP = "1999";
        /**  系统异常 */
        public static final String SYSTEM_EXCEPTION = "9999";

        public static final Map<String,String> RESP_INFO = new HashMap<>();

        static {
            RESP_INFO.put(SUCCESS,"服务器已成功处理了请求");
            RESP_INFO.put(ERROR,"服务器遇到错误，无法完成请求");
            RESP_INFO.put(SUCCESS_NOT_RESPONSE_DATA,"服务器已成功处理请求，返回异常");
            RESP_INFO.put(USER_NOT_EXIST_OR_FORBIDDEN,"用户不存在或被禁用");
            RESP_INFO.put(REQUEST_NOT_EXIST,"请求的接口不存在");
            RESP_INFO.put(NO_PERMISSION,"没有接口的访问权限");
            RESP_INFO.put(PARA_EMPTY_OR_FORMAT_ERROR,"参数为空或格式错误");
            RESP_INFO.put(ILLEGAL_IP,"非法IP请求");
            RESP_INFO.put(SYSTEM_EXCEPTION,"系统异常");

        }
    }

    /** 全局异常处理页面路径(user-service) **/
    public static final String DEFAULT_ERROR_VIEW_404 = "/exception-pages/404";
    public static final String DEFAULT_ERROR_VIEW_500 = "/exception-pages/500";

    /**
     * 正则表达式：验证手机号
     */
    public static final String REGEX_MOBILE ="^[1](([3|5|8][\\d])|([4][4,5,6,7,8,9])|([6][2,5,6,7])|([7][^9])|([9][1,8,9]))[\\d]{8}$";

    /**
     * 正则表达式：验证邮箱
     */
    public static final String EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

    /**
     * 18位身份证正则表达式
     */
    public static final String ID_CARD = "(^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}$)";

    /**
     * 6到14位密码正则表达式
     */
    public static final String MEMBER_PASSWORD="^(?=.*[0-9])(?=.*[a-zA-Z])(.{6,14})$";

    /** 短信验证码URL **/
    public static final String SMS_MESSAGE_URL = "http://61.178.19.5:8081/sendShortMessage";

    /** 服务器请求路径 */
    public static final String SERVER_IP = "http://192.168.10.57:8302";
    /** 保存在session中的用户信息的键名 */
    public static final String SESSION_USER = "___session_user";// 登录对象
    public static final String SESSION_USER_IP = "___session_user_ip"; // 登录IP地址
    public static final String SESSION_USER_AUTHCODE = "___session_user_authcode"; // 登录验证码
    public static final String SESSION_USER_ROLE = "___session_user_role_id";// 登录用户的角色Id
    public static final String SESSION_TIME = "___session_time";//系统当前时间（年月日）
    public static final int MENU_MAX_INDEX = 10; // 首页每个菜单最大显示的子菜单数
    public static final String CONFIG_FILE_SUPER_MANAGER_ROLE = "superManage";//配置文件中的超级管理员的角色
    public static final String TRANSMIT_RES_KEY = "___resKey";//传递资源主键
    /**超级管理员账号*/
    public static final String SYS_ADMIN = "admin";





    /** 日志类型-业务操作日志 */
    public static final String LOG_TYPE_OPT = "001";
    /** 日志类型-异常日志  */
    public static final String LOG_TYPE_EXP = "002";
    /** 日志类型-登陆日志	 */
    public static final String LOG_TYPE_A = "00A";
    /** 日志类型-操作日志	 */
    public static final String LOG_TYPE_B = "001";

    /** 默认分页页数为10 */
    public static final int DEFAULT_PAGE_SIZE = 10;

    /**收藏页面 默认分页页数为10 */
    public static final int COLLECT_PAGE_SIZE = 3;

    /**默认分页页数为1 */
    public static final int DEFAULT_PAGE_NUM = 1;

    /** 有效状态 */
    public static final int STATE_VALID = 0;
    /** 无效状态 */
    public static final int STATE_INVALID = -1;

    /** 父部门、父资源、父参数标示*/
    public static final String PARNENT_FLAG = "0";

    /** 用户初始密码*/
    public static final String INIT_PASSWORD="123456";

    /** 系统定义性别参数*/
    public static final String PARAM_SEX = "sex";
    /**用户性别:男 00A*/
    public static final String USER_SEX_NAN="00A";
    /**用户性别:女 00B*/
    public static final String USER_SEX_NV="00B";

    /**char 参数：是**/
    public static final String CHAR_TRUE = "00A";
    /**char 参数：否**/
    public static final String CHAR_FALSE = "00B";
    /**授权    未授权*/
    public static final String AUTHORIZATION_NULL = "00B";
    /**授权    已授权*/
    public static final String AUTHORIZATION_YES = "00A";
    /**父资源标识*/
    public static final String ROOT_PARNENT_FLAG = "0";
    /**菜单资源*/
    public static final String RES_LOGO = "RES_LOGO";
    /** 父参数标示*/
    public static final String PARNENT_SYSPARAM_FLAG = "0";


    /**是否删除字段*/
    public static final Integer DEL_FLAG_FALSE=0;

    public static final Integer DEL_FLAG_true=-1;

    /**是否有效字段*/
    public static final Integer STATUS_FALSE=-1;

    public static final Integer STATUS_TRUE=0;

    public static final Integer LOG_INSERT=1;
    public static final Integer LOG_DEL=2;
    public static final Integer LOG_UPDATE=3;


    /** 超级管理员角色*/
    public static final String  SUPER_MANAGER_ROLE = "40288ab15f9f8213015f9f8c8fa20016";








}
