package com.yq.util.giftCode;

import java.util.ArrayList;
import java.util.List;

public class GiftCodeGen {
    static String stringtable = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjklmnpqrstuvwxyz23456789";
    final static String password = "zcwy";

    //从byte转为字符表索引所需要的位数	
    final static int convertByteCount = 5;

    final static int codeLength=12;

    public static void main(String[] args) throws Exception {
        System.out.println(getGiftCodeLst(1,10,12));
    }


    public static List<String> getGiftCodeLst(int type,int size,int codeLength){
        return create((byte)type,size,codeLength,password);
    }

    /**
     * 生成兑换码
     * * 这里每一次生成兑换码的最大数量为int的最大值即2147483647
     * * @param time
     * * @param id
     * * @param count
     * * @return
     */
    private static List<String> create(byte type, int codecount, int codelength, String password) {
        List<String> giftIDList=new ArrayList<>();
        //8位的数据总长度		
        int fullcodelength = codelength * convertByteCount / 8;
        //随机码对时间和id同时做异或处理		
        //类型1，id4，随机码n,校验码1 		
        int randcount = fullcodelength - 6;//随机码有多少个		

        //如果随机码小于0 不生成		
        if (randcount <= 0) {
            return null;
        }
        for (int i = 0; i < codecount; i++) {
            //这里使用i作为code的id
            //生成n位随机码
            byte[] randbytes = new byte[randcount];
            for (int j = 0; j < randcount; j++) {

                randbytes[j] = (byte) (Math.random() * Byte.MAX_VALUE);
            }
            //存储所有数据
            ByteHapper byteHapper = ByteHapper.CreateBytes(fullcodelength);
            byteHapper.AppendNumber(type).AppendNumber(i).AppendBytes(randbytes);
            //计算校验码 这里使用所有数据相加的总和与byte.max 取余
            byte verify = (byte) (byteHapper.GetSum() % Byte.MAX_VALUE);
            byteHapper.AppendNumber(verify);
            //使用随机码与时间和ID进行异或
            for (int j = 0; j < 5; j++) {

                byteHapper.bytes[j] = (byte) (byteHapper.bytes[j] ^ (byteHapper.bytes[5 + j % randcount]));
            }
            //使用密码与所有数据进行异或来加密数据
            byte[] passwordbytes = password.getBytes();
            for (int j = 0; j < byteHapper.bytes.length; j++) {

                byteHapper.bytes[j] = (byte) (byteHapper.bytes[j] ^ passwordbytes[j % passwordbytes.length]);
            }


            //这里存储最终的数据
            byte[] bytes = new byte[codelength];


            //按6位一组复制给最终数组
            for (int j = 0; j < byteHapper.bytes.length; j++) {

                for (int k = 0; k < 8; k++) {

                    int sourceindex = j * 8 + k;

                    int targetindex_x = sourceindex / convertByteCount;

                    int targetindex_y = sourceindex % convertByteCount;

                    byte placeval = (byte) Math.pow(2, k);

                    byte val = (byte) ((byteHapper.bytes[j] & placeval) == placeval ? 1 : 0);

                    //复制每一个bit

                    bytes[targetindex_x] = (byte) (bytes[targetindex_x] | (val << targetindex_y));

                }
            }


            StringBuilder result = new StringBuilder();
            //编辑最终数组生成字符串
            for (int j = 0; j < bytes.length; j++) {

                result.append(stringtable.charAt(bytes[j]));
            }
            giftIDList.add(result.toString());
        }

        return giftIDList;
    }

    /**
     * 验证兑换码	 * @param code
     */
    private static void VerifyCode(String code) {
        byte[] bytes = new byte[code.length()];

        //首先遍历字符串从字符表中获取相应的二进制数据		
        for (int i = 0; i < code.length(); i++) {
            byte index = (byte) stringtable.indexOf(code.charAt(i));
            bytes[i] = index;
        }

        //还原数组		
        int fullcodelength = code.length() * convertByteCount / 8;
        int randcount = fullcodelength - 6;//随机码有多少个		

        byte[] fullbytes = new byte[fullcodelength];
        for (int j = 0; j < fullbytes.length; j++) {
            for (int k = 0; k < 8; k++) {

                int sourceindex = j * 8 + k;

                int targetindex_x = sourceindex / convertByteCount;

                int targetindex_y = sourceindex % convertByteCount;


                byte placeval = (byte) Math.pow(2, targetindex_y);

                byte val = (byte) ((bytes[targetindex_x] & placeval) == placeval ? 1 : 0);


                fullbytes[j] = (byte) (fullbytes[j] | (val << k));
            }
        }
        //解密，使用密码与所有数据进行异或来加密数据		
        byte[] passwordbytes = password.getBytes();
        for (int j = 0; j < fullbytes.length; j++) {
            fullbytes[j] = (byte) (fullbytes[j] ^ passwordbytes[j % passwordbytes.length]);
        }
        //使用随机码与时间和ID进行异或		
        for (int j = 0; j < 5; j++) {
            fullbytes[j] = (byte) (fullbytes[j] ^ (fullbytes[5 + j % randcount]));
        }

        //获取校验码 计算除校验码位以外所有位的总和		
        int sum = 0;
        for (int i = 0; i < fullbytes.length - 1; i++) {
            sum += fullbytes[i];
        }
        byte verify = (byte) (sum % Byte.MAX_VALUE);

        //校验		
        if (verify == fullbytes[fullbytes.length - 1]) {
            System.out.println(code + " : verify success!");
        } else {
            System.out.println(code + " : verify failed!");
        }
    }


}
