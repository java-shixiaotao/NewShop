package com.yq.util.qrCode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

public class ImageAndQRcode {
    private static final int BLACK = 0xFF000000;

    private static final int WHITE = 0xFFFFFFFF;


    public ImageAndQRcode() {

    }


    private static BufferedImage toBufferedImage(BitMatrix matrix) {

        int width = matrix.getWidth();

        int height = matrix.getHeight();

        BufferedImage image = new BufferedImage(width, height,

                BufferedImage.TYPE_INT_RGB);

        for (int x = 0; x < width; x++) {

            for (int y = 0; y < height; y++) {

                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);

            }

        }

        return image;

    }


    private static void writeToFile(BitMatrix matrix, String format, File file)

            throws IOException

    {

        BufferedImage image = toBufferedImage(matrix);

        if (!ImageIO.write(image, format, file)) {

            throw new IOException("Could not write an image of format "

                    + format + " to " + file);

        }

    }

    /**
     *      * @Title: 构造图片
     * <p>
     *      * @Description: 生成水印并返回java.awt.image.BufferedImage
     * <p>
     *      * @param file源文件(图片)
     * <p>
     *      * @param waterFile水印文件(图片)
     * <p>
     *      * @param x距离右下角的X偏移量
     * <p>
     *      * @param y 距离右下角的Y偏移量
     * <p>
     *      * @param alpha 透明度, 选择值从0.0~1.0: 完全透明~完全不透明
     * <p>
     *      * @return BufferedImage
     * <p>
     *      * @throws IOException
     * <p>
     *     
     */


    private static BufferedImage watermark(File file, File waterFile, int x, int y, float alpha) throws IOException {

        // 获取底图

        BufferedImage buffImg = ImageIO.read(file);

        // 获取层图

        BufferedImage waterImg = ImageIO.read(waterFile);

        // 创建Graphics2D对象，用在底图对象上绘图

        Graphics2D g2d = buffImg.createGraphics();

        int waterImgWidth = waterImg.getWidth();// 获取层图的宽度

        int waterImgHeight = waterImg.getHeight();// 获取层图的高度

        // 在图形和图像中实现混合和透明效果

        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));

        // 绘制

        g2d.drawImage(waterImg, x, y, waterImgWidth, waterImgHeight, null);

        g2d.dispose();// 释放图形上下文使用的系统资源

        return buffImg;

    }


    /**
     *      * 输出水印图片
     * <p>
     *      * 
     * <p>
     *      * @param buffImg 图像加水印之后的BufferedImage对象
     * <p>
     *      * @param savePath 图像加水印之后的保存路径
     * <p>
     *     
     */


    private void generateWaterFile(BufferedImage buffImg, String savePath) {

        int temp = savePath.lastIndexOf(".") + 1;

        try {

            ImageIO.write(buffImg, savePath.substring(temp), new File(savePath));

        } catch (IOException e1) {

            e1.printStackTrace();

        }

    }


    /**
     *      * 
     * <p>
     *      * @param text 二维码内容
     * <p>
     *      * @param width 二维码图片宽度
     * <p>
     *      * @param height 二维码图片高度
     * <p>
     *      * @param format 二维码的图片格式
     * <p>
     *      * @param sourceFilePath 底层图片路径
     * <p>
     *      * @param waterFilePath 二维码路径
     * <p>
     *      * @param saveFilePath 合成图片路径
     * <p>
     *      * @param maginx  二维码距离底图x轴距离
     * <p>
     *      * @param maginy  二维码距离底图y轴距离
     * <p>
     *      * @throws Exception
     * <p>
     *     
     */


    public void addImageQRcode(String text, int width, int height, String format,

                               String sourceFilePath, String waterFilePath, String saveFilePath, int maginx, int maginy) throws Exception {


        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();

        hints.put(EncodeHintType.CHARACTER_SET, "utf-8"); // 内容所使用字符集编码
        hints.put(EncodeHintType.MARGIN, 1);
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text,

                BarcodeFormat.QR_CODE, width, height, hints);

        // 生成二维码

        File outputFile = new File(waterFilePath);

        ImageAndQRcode.writeToFile(bitMatrix, format, outputFile);

        ImageAndQRcode newImageUtils = new ImageAndQRcode();

        // 构建叠加层


        BufferedImage buffImg = ImageAndQRcode.watermark(new File(sourceFilePath), new File(waterFilePath), maginx, maginy, 1.0f);

        // 输出水印图片

        newImageUtils.generateWaterFile(buffImg, saveFilePath);

    }
}