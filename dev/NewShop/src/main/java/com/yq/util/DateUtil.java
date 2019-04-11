package com.yq.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    public static String addAnyDay( int days) {
        try {
            DateFormat ymdDFM = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date dateStr = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateStr);
            calendar.add(Calendar.DAY_OF_YEAR, days);
            Date preOneDate = calendar.getTime();
            return ymdDFM.format(preOneDate);
        } catch (Exception e) {
        }
        return "";
    }

}
