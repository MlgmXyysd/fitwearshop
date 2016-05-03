package com.org.fitwear.model.shop;

import java.util.Date;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class FitwearApp {
	private Long id;

	private String appname;

	private String appnameEn;

	private String category;

	private String developer;

	private String developerEn;

	private String vername;

	private String vernameEn;

	private String vercode;

	private String summary;

	private String summaryEn;

	private String descriptEn;

	private String descript;

	private String logo;

	private String imgs;

	private String imgsEn;

	private String mApk;

	private String mApkEn;

	private String fApk;

	private String fApkEn;

	private Date createtime;

	private String operater;

	private Integer isdel;

	private String sortorder;

	private String mApkSize;

	private String fApkSize;

	private String packagename;

	private String magentlist;

//	private MultipartFile mapkfile;
//	private MultipartFile fapkfile;
//	private MultipartFile cutfile;
//	private MultipartFile logofile;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAppname() {
		return appname;
	}

	public void setAppname(String appname) {
		this.appname = appname == null ? null : appname.trim();
	}

	public String getAppnameEn() {
		return appnameEn;
	}

	public void setAppnameEn(String appnameEn) {
		this.appnameEn = appnameEn == null ? null : appnameEn.trim();
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category == null ? null : category.trim();
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer == null ? null : developer.trim();
	}

	public String getDeveloperEn() {
		return developerEn;
	}

	public void setDeveloperEn(String developerEn) {
		this.developerEn = developerEn == null ? null : developerEn.trim();
	}

	public String getVername() {
		return vername;
	}

	public void setVername(String vername) {
		this.vername = vername == null ? null : vername.trim();
	}

	public String getVernameEn() {
		return vernameEn;
	}

	public void setVernameEn(String vernameEn) {
		this.vernameEn = vernameEn == null ? null : vernameEn.trim();
	}

	public String getVercode() {
		return vercode;
	}

	public void setVercode(String vercode) {
		this.vercode = vercode == null ? null : vercode.trim();
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary == null ? null : summary.trim();
	}

	public String getSummaryEn() {
		return summaryEn;
	}

	public void setSummaryEn(String summaryEn) {
		this.summaryEn = summaryEn == null ? null : summaryEn.trim();
	}

	public String getDescriptEn() {
		return descriptEn;
	}

	public void setDescriptEn(String descriptEn) {
		this.descriptEn = descriptEn == null ? null : descriptEn.trim();
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript == null ? null : descript.trim();
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo == null ? null : logo.trim();
	}

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs == null ? null : imgs.trim();
	}

	public String getImgsEn() {
		return imgsEn;
	}

	public void setImgsEn(String imgsEn) {
		this.imgsEn = imgsEn == null ? null : imgsEn.trim();
	}

	public String getmApk() {
		return mApk;
	}

	public void setmApk(String mApk) {
		this.mApk = mApk == null ? null : mApk.trim();
	}

	public String getmApkEn() {
		return mApkEn;
	}

	public void setmApkEn(String mApkEn) {
		this.mApkEn = mApkEn == null ? null : mApkEn.trim();
	}

	public String getfApk() {
		return fApk;
	}

	public void setfApk(String fApk) {
		this.fApk = fApk == null ? null : fApk.trim();
	}

	public String getfApkEn() {
		return fApkEn;
	}

	public void setfApkEn(String fApkEn) {
		this.fApkEn = fApkEn == null ? null : fApkEn.trim();
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getOperater() {
		return operater;
	}

	public void setOperater(String operater) {
		this.operater = operater == null ? null : operater.trim();
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder == null ? null : sortorder.trim();
	}

	public String getmApkSize() {
		return mApkSize;
	}

	public void setmApkSize(String mApkSize) {
		this.mApkSize = mApkSize == null ? null : mApkSize.trim();
	}

	public String getfApkSize() {
		return fApkSize;
	}

	public void setfApkSize(String fApkSize) {
		this.fApkSize = fApkSize == null ? null : fApkSize.trim();
	}

	public String getPackagename() {
		return packagename;
	}

	public void setPackagename(String packagename) {
		this.packagename = packagename == null ? null : packagename.trim();
	}

	public String getMagentlist() {
		return magentlist;
	}

	public void setMagentlist(String magentlist) {
		this.magentlist = magentlist == null ? null : magentlist.trim();
	}

	/*public MultipartFile getMapkfile() {
		return mapkfile;
	}

	public void setMapkfile(MultipartFile mapkfile) {
		this.mapkfile = mapkfile;
	}

	public MultipartFile getFapkfile() {
		return fapkfile;
	}

	public void setFapkfile(MultipartFile fapkfile) {
		this.fapkfile = fapkfile;
	}

	public MultipartFile getCutfile() {
		return cutfile;
	}

	public void setCutfile(MultipartFile cutfile) {
		this.cutfile = cutfile;
	}

	public MultipartFile getLogofile() {
		return logofile;
	}

	public void setLogofile(MultipartFile logofile) {
		this.logofile = logofile;
	}
	*/
	
}