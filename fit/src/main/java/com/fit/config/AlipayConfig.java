package com.fit.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016093000630318";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC/7cmLl30NIznppGVW8ERpB945eEyR0IUmnDz58GSrc+RlCkoi4Y0suJ9xOvnrAcYi/AW6GA+gBrSy88/F9cwRWPBXP1hPL9+W2bWoNc68USw5c4DtViFfHgCKIsc4mHqlQQdRB2xdmAC082F1LSJjBB7SEfJWTl/+z/U0hPVI3okKJGkBDJUOnudVCrcQSRqP85Fp5oNZGroo3kx8UxYQvp5qvRU67/hGbfXolXtHPjR2ONg1q5E9FSmOz456npOGZ9y6RD9NZcU/XB78WCGA0Msg2mi40z/YGFpzycf6lAEWUa5xKkWE5726QaMMUYfweXqkSkso3Ipc0nXtydmfAgMBAAECggEADIvCrPlOF1nCI1+3sCMslaEKCb+vYai7y3ZTFhN8wShmOaSejAEqdU3sPj6Yr6ACD69hwHRqMQ+/KCN/5XTXzhp+O3XMlACRIQ9CLKi3xt+XgHnoZ5tFuy3+4wi69RwiiELj84wErWmOQkXWjQ5SPR671QePS8z7wXBemvxF/GlSlrX1/1qYwKrfdttusRQaXw/rrOQAFR5I8DlG66EvsaQIBh9OiP7Jftjy5uIVsoRfBNPaGmWU6zIc/ciMC9Pky8f057BrUymlN8KVyPcP8a/ES1iaiQ/CtfyEKDxIG2zZmguVvL6S2yhhFecS1e5fTIEsGLaYG8xaYvrgv0CUoQKBgQDjgDGfeMU0EGLTgQBgqrrcr0i7S1eqSDQKDKBPYl2CxoSDMHBxmq9OLdGQ71ocIX5GpXm/GX5KkBKT3WRr1PsaQWvQL5RsK2fxbPDLuRxgvKVj/gx9/cb8alFtlfkPspVehi3bvM2J9x1XPUlHdps0OU7QPOE4OwclVTGKSYNDvQKBgQDX+NMxbm2d/U0KZxvu3dv1gHDT62zY/8nhra2qlQ2Ex36bslT3RKAgjouO0EyMDIcv9G3kY6pUQQbgRrg7e8/lVHn56yzlUu85U0SCngOG4GRplEoZexcIhfcUvUf5jbvicyWCXwKkgO3DGFRW+7SUjzh+T1jFVze+d2snv+x6iwKBgHrFSII943Y4TYzENhb0q8jCUya3/wQm2OZ/b9fHRp13UjWV42h7SJWRBmIHuQIrVQD89dmaAVxtqYjgVfwXQLcnjO4Zbyh8uChCWSQnrlfKFhsDE2y+ki7PlUflQjYlcpRDJuZJWkZU9CGLMkt9hz5EmvKnmAcHW9Day9RL3amlAoGAVuPuHCIgigLB/yBytYyfFUuimTBLr5Zho6FbkJi9QqF8h6mc04rRnaeb8E5PrbzQmvONTujmO1WaLZtmPdBXWR2+oVUD0BOo2XhtxNtL8fTPkUau9Ud3gd9cBAUPMxDZ+YZ4HdaZ2pNglTBxpjlIcsiYYwELZwHrFH85JlnqC3cCgYEAgq93modg1AF6pRJMbzheOn9tJltxYyJRt02z3P0MDYt0bivek/pYzg4IrS+o3pUEObJ3yYYgKc054TyzXmPxiaUnZwMRNRFPol7aPNJ2u0+wIFzQKNL1C8baT6wSfd9sxguScdZYZsSVe5DhHc3wkz72fQPqV3o02dzC06ckutg=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoDRTWjeiHohreRWwYvAVRNoLGJAY9qxqaeDh6A7fJmO4jxkKfr1DCF2N3hAhPOjE6gX1hoSWDE6C6dYJy0uLTmuMlBWbRHV+x1CWk2jNFprnPCp9480YA+15FlDKSQIOuNyKfQclhg8pYcf1SOn5ZMwYOnEIIYf4wCn7OjKrpyxED7JNU/2HgFkaHjaeDv1CgMOHYxebiZJH+iGBONEavSQH7c+pfDwLZcUffraJUeoHJdwi7+bMiLzt2GFosAUJ4jRajdQwEcZygGWvRlrj79/Lyp98azcD8+lb86Zzf0Uq+FqLnrvtfYj5QrcfnwstjNWAETFKWALDXWdOzMN4+wIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay/toNotify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/alipay/return_url";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

