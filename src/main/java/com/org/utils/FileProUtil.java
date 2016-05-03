package com.org.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FileProUtil {
	//上传路径前缀
	@Value("${file.base.upota.url}")
    private String fileSavePath;
	//下载前缀
    @Value("${file.base.updowlota.url}")
    private String fileBakPath;

    //上传路径
    @Value("${file.base.apk}")
    private String basePag;
    
	public String getFileSavePath() {
		return fileSavePath;
	}

	public String getFileBakPath() {
		return fileBakPath;
	}

	public String getBasePag() {
		return basePag;
	}

	
    
    
        
}
