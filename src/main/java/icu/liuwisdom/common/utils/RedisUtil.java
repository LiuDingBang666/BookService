package icu.liuwisdom.common.utils;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/*
 * Redis数据库工具
 * */

public class RedisUtil {

    /*
     * 获取数据库连接对象
     */
    public static Jedis getJedis() {
        String addr = "47.111.28.14";
        int port = 6379;
        JedisPoolConfig config = new JedisPoolConfig();// 配置对象
        JedisPool pool = new JedisPool(config, addr, port);// 配置、地址、端口号
        Jedis jedis = pool.getResource();// 向Jedis里面存储数据,获取连接
        jedis.auth("redis!123456");
        return jedis;
    }


    /*
     *
     * 向Redis中发送验证码
     *
     */
    public static void redisSend(String tel,String code) {
        Jedis jedis = RedisUtil.getJedis();
        jedis.set(tel, code);// 键值对型数据库
        jedis.expire(tel, 60);
        jedis.close();
    }

    /*
     * 根据手机号获取验证码
     *
     */
    public static String getCode(String tel) {
        Jedis jedis = RedisUtil.getJedis();
        String code = jedis.get(tel);
        jedis.close();
        return code;
    }




}
