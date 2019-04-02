package com.yq.service;

import com.yq.dao.TemplateGiftDao;
import com.yq.entity.TemplateGift;
import com.yq.entity.TemplateGiftDetail;
import com.yq.util.giftCode.GiftCodeGen;
import com.yq.util.pdfPackage.PDFUtil;
import com.yq.util.qrCode.CompressedFileUtil;
import com.yq.util.qrCode.ImageAndQRcode;
import com.yq.util.qrCode.QRCodeUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Transactional
@Service
public class TemplateGiftService {
    @Autowired
    private TemplateGiftDao templategiftDao;

    public int count(TemplateGift template) {
        return templategiftDao.tgcount(template);
    }

    public List<TemplateGift> list(TemplateGift templateg) {
        return templategiftDao.tglist(templateg);
    }

    public List<TemplateGiftDetail> listById(TemplateGiftDetail templateg) {
        List<TemplateGiftDetail> list = templategiftDao.tglistById(templateg);
        return list;
    }

    public ResponseEntity<byte[]> download(TemplateGiftDetail templateg, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ImageAndQRcode add = new ImageAndQRcode();
        List<Map<String, Object>> list = templategiftDao.tggiftidlistById(templateg);
        String dirPath = request.getSession().getServletContext().getRealPath("/");
        if (list != null && list.size() > 0) {
            String filename = list.get(0).get("TEMPLATENAME").toString();
            //生成二维码路径
            String erWeiMaPath = dirPath + list.get(0).get("TEMPLATENAME").toString() + "二维码";
            //生成合成png路径
            String heChengPNGPath = dirPath + list.get(0).get("TEMPLATENAME").toString() + "合成PNG";
            //合成pdf路径
            String heChengPDFPath = dirPath + list.get(0).get("TEMPLATENAME").toString();
            //生成zip包路径
            String zipPath = dirPath + list.get(0).get("TEMPLATENAME").toString() + ".zip";

            File erWeiMaFile = new File(erWeiMaPath);
            File heChengPNGFile = new File(heChengPNGPath);
            heChengPNGFile.mkdir();
            File heChengPDFFile = new File(heChengPDFPath);
            heChengPDFFile.mkdir();
            File zFile = new File(zipPath);
            if (zFile.exists()) {
                zFile.delete();
            }
            for (int i = 0; i < list.size(); i++) {
                String itemstr = "\\" + list.get(i).get("ITEMID").toString() + ".png";
                QRCodeUtil.generateQRCode(list.get(i).get("GIFT_ID").toString(), 95, 95, "png", erWeiMaPath, erWeiMaPath + itemstr);
                add.addImageQRcode(list.get(i).get("GIFT_ID").toString(), 95, 95, "png",
                        dirPath + "\\image\\model.png",
                        erWeiMaPath + itemstr,
                        heChengPNGPath + itemstr,
                        580, 200);
            }
            final List<String> itemLst
                    = list.stream().map(one -> heChengPNGFile + "\\" + one.get("ITEMID") + ".png").collect(Collectors.toList());
            PDFUtil.createPDF(itemLst, heChengPDFPath, filename);
            CompressedFileUtil compressedFileUtil = new CompressedFileUtil();
            compressedFileUtil.compressedFile(heChengPDFPath, dirPath);

            // 判断是否为文件
            if (erWeiMaFile.isFile()) {
                deleteFile(erWeiMaPath);
            } else {
                deleteDirectory(erWeiMaPath);
            }

            // 判断是否为文件
            if (heChengPNGFile.isFile()) {
                deleteFile(heChengPNGPath);
            } else {
                deleteDirectory(heChengPNGPath);
            }
            // 判断是否为文件
            if (heChengPDFFile.isFile()) {
                deleteFile(heChengPDFPath);
            } else {
                deleteDirectory(heChengPDFPath);
            }

            try {
                String new_filename = URLEncoder.encode(filename, "UTF8");
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.setContentDispositionFormData("attachment;filename=", new_filename + ".zip");
                return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(zipPath)),
                        headers, HttpStatus.OK);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
//    public ResponseEntity<byte[]> download(TemplateGiftDetail templateg, HttpServletRequest request,
//                         HttpServletResponse response) throws Exception {
//
//        List<Map<String, Object>> list = templategiftDao.tggiftidlistById(templateg);
//        String dirPath = request.getSession().getServletContext().getRealPath("/");
//         if(list!=null&&list.size()>0) {
//             String filename = list.get(0).get("TEMPLATENAME").toString();
//             String filePath = dirPath + list.get(0).get("TEMPLATENAME").toString();
//             String zipPath = dirPath + list.get(0).get("TEMPLATENAME").toString() + ".zip";
//             File fPath = new File(filePath);
//             File zPath = new File(zipPath);
//             if (zPath.exists()) {
//                 zPath.delete();
//             }
//             for (int i = 0; i < list.size(); i++) {
//                 BufferedImage img = null;
//                 String address = dirPath + list.get(i).get("TEMPLATENAME").toString();
//                 String itemstr = "\\" + list.get(i).get("ITEMID").toString() + ".png";
//                 QRCodeUtil.generateQRCode(list.get(i).get("GIFT_ID").toString(), 300, 300, "png", address, address + itemstr);
//             }
//
//             CompressedFileUtil compressedFileUtil = new CompressedFileUtil();
//             compressedFileUtil.compressedFile(filePath, dirPath);
//
//             // 判断是否为文件
//             if (fPath.isFile()) {  // 为文件时调用删除文件方法
//                 deleteFile(filePath);
//             } else {  // 为目录时调用删除目录方法
//                 deleteDirectory(filePath);
//             }
//
//             try {
//                 String new_filename = URLEncoder.encode(filename, "UTF8");
//                 HttpHeaders headers = new HttpHeaders();
//                 headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//                 headers.setContentDispositionFormData("attachment;filename=", new_filename + ".zip");
//                 String aa = dirPath + list.get(0).get("TEMPLATENAME").toString() + ".zip";
//                 return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(zipPath)),
//                         headers, HttpStatus.OK);
//             } catch (Exception e) {
//                 e.printStackTrace();
//             }
//         }
//         return null;
//    }

    public int inserttempg(Map<String, Object> map) throws Exception {

        TemplateGift tg = new TemplateGift();
        tg.setTemplate_id(map.get("template_id").toString());
        tg.setTemplateName(map.get("templateName").toString());
        tg.setNum(Integer.parseInt(map.get("num").toString()));
        tg.setCreateTime(map.get("createTime").toString());
        tg.setActionTime(map.get("actionTime").toString());
        int flag = 0;

        int i = templategiftDao.inserttempg(tg);
        int tgid = tg.getTgID();
        GiftCodeGen giftCodeGen = new GiftCodeGen();
        List<String> giftcodel = giftCodeGen.getGiftCodeLst(1, Integer.parseInt(map.get("num").toString()), 14);
        int j = inserttempgd(giftcodel, tg);
        if (i == 1 && j > 0) {
            flag = 1;
        }
        if (i == 0 || j <= 0) {
            throw new RuntimeException("模板券明细表");
        }
        return flag;
    }

    public int inserttempgd(List<String> giftid, TemplateGift tg) {
        List<TemplateGiftDetail> tgds = new ArrayList<>();
        int issuccess = 0;
        if (tg.getTgID() != null && giftid != null && giftid.size() > 0) {
            for (int i = 0; i < giftid.size(); i++) {
                TemplateGiftDetail tgd = new TemplateGiftDetail(giftid.get(i).toString(), tg.getTemplate_id(), 0, tg.getTgID(), tg.getCreateTime(), tg.getActionTime());
                tgds.add(tgd);
            }
            issuccess = templategiftDao.insertCodeBatch(tgds);
        }
        return issuccess;
    }


    /**
     * 删除单个文件
     *
     * @param sPath 被删除文件path
     * @return 删除成功返回true，否则返回false
     */
    public boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }

    /**
     * 删除目录以及目录下的文件
     *
     * @param sPath 被删除目录的路径
     * @return 目录删除成功返回true，否则返回false
     */
    public boolean deleteDirectory(String sPath) {
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!sPath.endsWith(File.separator)) {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        //如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        boolean flag = true;
        //删除文件夹下的所有文件(包括子目录)
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            //删除子文件
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath());
                if (!flag) break;
            } //删除子目录
            else {
                flag = deleteDirectory(files[i].getAbsolutePath());
                if (!flag) break;
            }
        }
        if (!flag) return false;
        //删除当前目录
        if (dirFile.delete()) {
            return true;
        } else {
            return false;
        }
    }
}
