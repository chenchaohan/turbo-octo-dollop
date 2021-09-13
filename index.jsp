<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.huawei.iptvmw.epg.bean.info.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.ZoneOffset" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="com.huawei.iptvmw.epg.bean.info.UserProfile" %>


<%--
发布生产前必读

1.修改backUrl()方法

--%>
<%
    //
    //    Object STBType = Authentication.CTCGetConfig("STBType");

    String STBType = "";


    //测试true 生产 false
    Boolean devOrPro = true;

    //上线后去掉
    String backUrl = "http://113.12.94.35:6004/hall_gx/hide_enter.html?id=1&returnurl=http%3A%2F%2F222.217.101.154%3A33200%2FEPG%2Fjsp%2FHDV3Formal%2Fen%2Fthird_app.jsp%3FrecommCollectId%3DepgIndex_area0_5%24a27a796e29a6dfe76ee64a3734ee503f%26back%3D1%26returnurl%3Dhttp%3A%2F%2F222.217.101.154%3A33200%2FEPG%2Fjsp%2FHDV3Formal%2Fen%2Findex.jsp&focusIndex=1&focusClass=btn-nav&menuIndex=1";
    //上线后去掉 end


    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String returnUrl = request.getRequestURI();
    String requestURI = request.getRequestURI().replace("/EPG/jsp/xinchan/coupon/index.jsp", "");
    // String goOrder = requestURI + "/EPG/jsp/HDV3Formal/en/epgToThirdUrl_HW_GXZZ.jsp?thirdurl=http://222.217.77.13:33200/bytuetechAPI/jsp/editmovie/hall/index.jsp?division=10000100000000090000000000048430&isNewMovie=1&returnurl="+basePath + returnUrl;

    //
    String goOrder = "http://222.217.77.25:8090/epg/iptvepg/biz_76945095.epg?division=film&returnurl="+basePath + returnUrl;


    UserProfile user = new UserProfile(request);
    //用户ID
    String userId = user.getUserId();
    int area_id=user.getAreaId();
    //测试用的

    //用户令牌
    String userToken = user.getUserToken();
    //用户令牌到期时间
    String expireTime = user.getExpireTime();
    //用户所属组ID
    String userGroupId = user.getUserGroupId();
    //区域ID
    int areaId = user.getAreaId();
    //机顶盒ID
    String stbId = user.getStbId();
    //机顶盒IP
    String stbIP = user.getStbIp();


    //REQ_HEAD
    String APP_ID = "100018";
    String key = "";
    String API_URL = "";



    if(devOrPro){
        //测试
        key = "A86E19D5B3E5C1439D38D9043BFDAB0BCE013494FED9E3A1";
        API_URL = "http://113.12.94.9:35301/itvMpApi/Services";
    }else{
        //生产
        key = "5419A4E0A192891940F71A1992914C7AEAC8E53D49B6CE4C";
        API_URL = "http://113.12.94.9:7001/itvMpApi/Services";
    }

    //REQ_BODY
    String acceptTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    String endDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));//时间
    System.out.println("acceptTime >>>>>> " + acceptTime);
    String instant = String.valueOf(LocalDateTime.now().toInstant(ZoneOffset.of("+8")).toEpochMilli());
    String payTradeId = acceptTime.concat(instant);//兑换流水号

    String AREACODE = null;
    String CITYCODE = null;
    switch (area_id){
        case 10000:
            AREACODE = "0771";//测试账号
            CITYCODE = "1100";//测试账号
            break;
        case 10004:
            AREACODE = "0771";//南宁
            CITYCODE = "1100";//南宁
            break;
        case 10005:
            AREACODE = "0777";//钦州
            CITYCODE = "1700";//钦州
            break;
        case 10006:
            AREACODE = "0778";//河池
            CITYCODE = "1800";//河池
            break;
        case 10009:
            AREACODE = "0779";//北海
            CITYCODE = "1900";//北海
            break;
        case 10010:
            AREACODE = "0770";//防城港
            CITYCODE = "2000";//防城港
            break;
        case 10011:
            AREACODE = "0771";//崇左
            CITYCODE = "2100";//崇左
            break;
        case 10013:
            AREACODE = "0772";//来宾
            CITYCODE = "2200";//来宾
            break;
        case 10014:
            AREACODE = "0774";//贺州
            CITYCODE = "2400";//贺州
            break;
        case 10015:
            AREACODE = "0775";//贵港
            CITYCODE = "2500";//贵港
            break;
        case 10018:
            AREACODE = "0776";//百色
            CITYCODE = "1600";//百色
            break;
        case 10019:
            AREACODE = "0772";//柳州
            CITYCODE = "1200";//柳州
            break;
        case 10020:
            AREACODE = "0773";//桂林
            CITYCODE = "1300";//桂林
            break;
        case 10021:
            AREACODE = "0774";//梧州
            CITYCODE = "1400";//梧州
            break;
        case 10022:
            AREACODE = "0775";//玉林
            CITYCODE = "1500";//玉林
            break;
    }


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="page-view-size" content="1280*720" />
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<title>优惠券</title>

		<!--css引用-->
		<script type="text/javascript">
			var deviceWidth = parseInt(window.screen.width); //获取当前设备的屏幕宽度
			var deviceScale = deviceWidth / 1280; //得到当前设备屏幕与640之间的比例，之后我们就可以将网页宽度固定为640px
			var ua = navigator.userAgent;
			//获取当前设备类型（安卓或苹果）
			if (/Android (\d+\.\d+)/.test(ua)) {
				var version = parseFloat(RegExp.$1);
				if (version > 2.3) {
					document.write('<meta name="viewport" content="width=1280,initial-scale=' + deviceScale +
						', minimum-scale = ' + deviceScale + ', maximum-scale = ' + deviceScale +
						', target-densitydpi=device-dpi">');
				} else {
					document.write(
						'<meta name="viewport" content="width=1280,initial-scale=0.75,maximum-scale=0.75,minimum-scale=0.75,target-densitydpi=device-dpi" />'
					);
				}
			} else {
				document.write('<meta name="viewport" content="width=1280, user-scalable=no">');
			}
		</script>
		<link href="css/index-new.css" rel="stylesheet" type="text/css" />

		<!--SEO(重要)-->
		<meta name="keywords"
			content="广西电信宽带,光纤,光纤宽带,电信宽带,电信宽带套餐,电信宽带资费,电信宽带价格,电信宽带升级,宽带报装,宽带提速,宽带缴费,百兆光纤,百兆宽带,广西电信,IPTV,宽带电视,网络电视">
		<meta name="description"
			content="广西电信网上营业厅为您提供广西光纤宽带,电信宽带套餐,宽带提速升级,是您办理电信宽带报装,光纤宽带缴费和查询宽带资费价格的官方网站,电信宽带升级,宽带报装,宽带提速,宽带缴费,办理IPTV可在本站一步办理。">
		<!--SEO(重要) end-->

		<!--注：告诉设备不要将页面中的数字识别为电话号码-->
		<meta content="email=no" name="format-detection" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
		<style>
			#center-4 {
				/* background: #000; */
				width: 100%;
			}

			.form {
				width: 600px;
				height: 80px;
				padding: 40px;
				margin: 0 auto;
			}

			.form .count {
				display: inline-block;
				width: 400px;
			}

			.form input {
				width: 360px;
				font-size: 30px;
				height: 60px;
				text-indent: .5em;
				/*border: none;*/
				border-radius: 10px;
				border: 5px solid transparent;
			}

			.form input:focus {
				outline: 0;
			}

			.formButton {
				display: inline-block;
				height: 55px;
				/* margin-left: 20px; */
				width: 120px;
				text-align: center;
				line-height: 50px;
				font-size: 30px;
				border-radius: 10px;
				background-color: dodgerblue;
				color: #fff;
				border: 5px solid transparent;
			}

			.tips {
				font-size: 30px;
				text-align: center;
				margin-top: 50px;
			}
		</style>
	</head>


	</head>

	<body>
		<div class="wrapper">
			<div id="debug"></div>
			<div class="main">
				<p id="title" style="margin-top: 20px;">
					<span class="text-btn">可领取</span>
					<span class="w50">|</span>
					<span class="text-btn">已领取</span>
					<span class="w50">|</span>
					<span class="text-btn">已使用</span>
					<span class="w50">|</span>
					<span class="text-btn">已过期</span>
					<span class="w50">|</span>
					<span class="text-btn">去兑换</span>
				</p>
				<div id="con">
					<!-- 优惠券 -->
					<ul class="boxs-center on">
						<div class="boxs-li-s" id="center-0">
							<div class="boxs-li" id="boxs-li_0">

							</div>
						</div>
					</ul>
					<ul class="boxs-center ">
						<div class="boxs-li-s" id="center-1">
							<div class="boxs-li" id="boxs-li_1">

							</div>
						</div>

					</ul>
					<ul class="boxs-center">
						<div class="boxs-li-s" id="center-2">
							<div class="boxs-li" id="boxs-li_2">

							</div>
						</div>
					</ul>
					<ul class="boxs-center">
						<div class="boxs-li-s" id="center-3">
							<div class="boxs-li" id="boxs-li_3">

							</div>
						</div>
					</ul>
					<ul class="boxs-center">
						<div class="boxs-li-s" id="center-4">
							<div class="boxs-li form" id="boxs-li_4">
								<li style="width: 200px;">

									<input type="text" id="inputTICKETNO" class="box-btn5" placeholder="请输入兑换码" data-type="99" />
								</li>
								<li style="margin-left: 160px;margin-top: 17px;">
									<div class="box-btn5 formButton" id="btnOk" data-ok="999">确认</div>
								</li>
							</div>
							<div class="tips" id="tipsText">请输入兑换码！</div>
						</div>
					</ul>


				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/core.js"></script>
	<script type="text/javascript" src="js/cipher-core.js"></script>
	<script type="text/javascript" src="js/tripledes.js"></script>
	<script type="text/javascript" src="js/format-hex.js"></script>
	<script type="text/javascript" src="js/keyboard.min.js"></script>
	<script type="text/javascript">
		/**
		 * 页面调试打印
		 */
		function Debug(id) {
			// var obj = $(id);
			var obj = document.getElementById(id);
			/*是否自动清空打印信息*/
			this.autoClearMsg = true;
			/*是否自动隐藏*/
			this.autoHideBox = true;

			/**
			 * 初始化打印容器
			 */

			var init = function() {
				if (!!obj) {
					obj.style.zIndex = '9999';
					obj.style.position = 'absolute';
					obj.style.width = parseInt(document.body.clientWidth - 10) + 'px';
					obj.style.left = '10px';
					obj.style.bottom = '5px';
					obj.style.color = 'rgb(255, 255, 255)';
					//obj.style.borderBottom = '1px solid rgba(255, 255, 255, 0.5)';
					obj.style.backgroundColor = 'rgba(30, 105, 160, 0.2)';
					obj.style.display = 'none';
				};

				return this;
			};

			/**
			 * 打印内容信息（默认5秒后自动隐藏）
			 * @param String msg 要输出的内容信息
			 */
			var debugTimerId = undefined; /*定时器ID*/
			this.showTime = 5000; /*显示时间，默认5秒*/
			/**
			 * @param String msg 需要打印的消息
			 * @param boolean autoHide 是否自动隐藏（默认: true）
			 * @param boolean autoClear 是否自动清空信息（默认: false）
			 */
			this.print = function(msg, autoHide, autoClear) {
				if (!!obj) {
					if (autoClear == undefined) this.autoClearMsg = false;
					else this.autoClearMsg = !!autoClear;
					if (!!this.autoClearMsg) this.clear();
					if (obj.style.display == 'none') {
						obj.style.display = 'block';
					};
					obj.innerHTML += '<div style="border-bottom:1px solid rgba(255, 255, 255, 0.5); padding:3px 5px;">' +
						msg + '</div>';
					if (autoHide == undefined) this.autoHideBox = true;
					if (autoHide != undefined && this.autoHideBox == !0) this.autoHideBox = !!autoHide;
					else this.autoHideBox = !!autoHide;
					if (!!this.autoHideBox) {
						if (!!debugTimerId) debugTimerId = clearTimeout(debugTimerId);
						debugTimerId = setTimeout(this.hide, this.showTime);
					};
				};

				return this;
			};

			/**
			 * 清空内容信息
			 */
			this.clear = function() {
				if (!!obj) obj.innerHTML = '';
				return this;
			};

			/**
			 * 强制隐藏
			 */
			this.hide = function() {
				if (!!obj) {
					if (!!debugTimerId) debugTimerId = clearTimeout(debugTimerId);
					obj.style.display = 'none';
				}
				return this;
			};

			/**
			 * 强制显示
			 */
			this.show = function() {
				if (!!obj) {
					if (!!debugTimerId) debugTimerId = clearTimeout(debugTimerId);
					obj.style.display = 'block';
				}
				return this;
			};

			/**
			 * 设置自动隐藏
			 */
			this.setAutoHide = function(flag) {
				this.autoHideBox = !!flag;
				if (!!this.autoHideBox) {
					if (!!debugTimerId) debugTimerId = clearTimeout(debugTimerId);
					debugTimerId = setTimeout(this.hide, this.showTime);
				};
				return this;
			};

			/**
			 * 设置自动清空
			 */
			this.setAutoClear = function(flag) {
				this.autoClearMsg = !!flag;
				if (!!this.autoClearMsg) this.clear();
				return this;
			};

			init();
		};
	</script>
	<script type="text/javascript">
		var acceptTime = "<%= acceptTime %>";
		var userId = "<%=userId%>";
		var endDate = "<%=endDate%>";
		var APP_ID = '<%=APP_ID%>';
		var API_URL = '<%=API_URL%>';
		var key = '<%=key%>';
		//新增
		var __debug;
		__debug = new Debug('debug');
		document.getElementById('debug').style.backgroundColor = 'rgba(0,0,0,0.8)';
		document.getElementById('debug').style.wordBreak = 'break-all';

		window.onload = function() {

			var oTitle = document.getElementById('title');
			var aSpan = oTitle.getElementsByTagName('span');
			var oCon = document.getElementById('con');
			var aUl = oCon.getElementsByTagName('ul');
			var ipt = document.getElementById('inputTICKETNO');
			var text = document.getElementsByClassName("text-btn");
			var tindex = 0;
			var indexs = 0;
			var type = false
			text[0].style.color = '#fff';
			init();

			// 控制tab切换
			function init() {
				if (!type) {
					document.onkeydown = function(event) {
						if (!event) event = window.event;
						code = event.keyCode;

						switch (code) {
							case 37:
								if (tindex > 0) {
									tindex--
								}

								text[tindex].style.color = '#fff';
								text[tindex + 1].style.color = '';

								aUl[tindex].style.display = 'block';
								aUl[tindex + 1].style.display = 'none';
								break;
							case 39:
								if (tindex < 4) {
									tindex++
								}
								text[tindex].style.color = '#fff';
								text[tindex - 1].style.color = '';

								aUl[tindex].style.display = 'block';
								aUl[tindex - 1].style.display = 'none';
								if(tindex==4){
									setTimeout(function(){
										ipt.blur();
									},10)
									
								}
								break;
							case 40:
								var boxs_li = document.getElementById("boxs-li_" + tindex);
								if (boxs_li.innerHTML) {
									type = true
									container()
								}
								break;
							case 38:
								break;
							case 8:
								backUrl();
								break;
						}
					}
				}
			}

			// 控制内容
			function container() {

				var box = document.getElementsByClassName("box-btn" + tindex);
				indexs = 0;
				var maxindex = box.length; // 2
				console.log("maxindex", maxindex)
				console.log("tindex", tindex)   ;  //4
				for (var i = 0; i < box.length; i++) {
					if (type) {
						if (indexs == i) {
							if (tindex < 4) {
								box[i].style.borderColor = '#fff100'
							}
						}
					}
				}
				box[0].style.borderColor = '#fff100'
				box[1].style.borderColor = 'transparent'
				// 键盘控制
				if (type) {
					document.onkeydown = function(event) {
						if (!event) event = window.event;
						code = event.keyCode;
						// if(tindex == 4){
						// 	keyboardJS.pressKey(40);
						// }

						switch (code) {
							case 37:
								if(tindex<4){
									if (indexs > 0) {
										indexs--
									}
									console.log('左', indexs)
									if (indexs < 0) {
										return indexs = 0
									}
									if (indexs > -1 && maxindex > 0) {
										box[indexs].style.borderColor = '#fff100'
										box[indexs + 1].style.borderColor = 'transparent'
									}
								}

								if (tindex == 4) {
									if(indexs ==0){
										focusInput(0);

										indexs = 1;
									} else if(indexs ==1){
										// focusInput(1);

										indexs = 0
									}
								}
								break;
							case 38:
								if (maxindex == 0) {
									return
								}

								if (indexs > -1 && indexs < 3) {
									type = false

									box[indexs].style.borderColor = 'transparent'
									return init()
								}
								box[indexs - 3].style.borderColor = '#fff100'
								box[indexs].style.borderColor = 'transparent'

								indexs = indexs - 3
								focusInput(1);
								setTop()
								break;
							case 39:
								if (tindex != 4) {
									if (indexs < (maxindex - 1)) {
										indexs++
									}
									console.log('右', indexs)
									if (indexs > (maxindex - 1)) {
										return indexs
									}
									box[indexs].style.borderColor = '#fff100'
									if (indexs > 0) {
										box[indexs - 1].style.borderColor = 'transparent'
									}
									if (indexs == maxindex - 2) {
										setBottom()
									}
								} else if(tindex==4){
									//focusInput(1);
									// code = 40
								 if(indexs ==0){
									 	focusInput(0);
									 	indexs =1
									 }else {
									 	focusInput(1);
									 	indexs=0
									 }
								}
								break;
							case 40:
								if(tindex !=4){
									if (indexs + 3 > (maxindex - 1)) {
										return indexs
									}
									box[indexs + 3].style.borderColor = '#fff100'
									box[indexs].style.borderColor = 'transparent'
									indexs = indexs + 3
									if (indexs > 5) {
										setBottom()
									}
								}else if(tindex ==4){
									indexs=0;
									setTimeout(function(){
										focusInput(0);
									},10)
									
								}

								break;
							case 13:
								//确认
								if(tindex !=4){
									if (maxindex == 0) {
										return
									}

									var data_coupId = box[indexs].getAttribute("data-coupId")
									if (box_type == 0) {
										var json = getCoupons(data_coupId);
										if (null != json) {
											window.location.reload();
										}
									} else if (box_type == 1) {
										go_used();
									} else if (box_type == 99) {

									}
								}else if(tindex ==4) {
									code = 40;

									focusInput(0)
								}

								//去兑换
								break;
							case 8:
								code = 37
								document.getElementsByClassName("box-btn5")[0].blur()
								backUrl();
								break;
						}
					}
				}

				// 向上
				function setTop() {
					var centers = document.getElementById("center-" + tindex);
					centers.scrollTop = centers.scrollTop - 135;
				}
				// 向下
				function setBottom() {
					var centers = document.getElementById("center-" + tindex);
					centers.scrollTop = centers.scrollTop + 135;
				}
			}
			//键盘控制end
			available();
			received();
			used();
			expired();

			//可领取
			function available() {
				var gc = getCanReceiveCoupons();
				var couponsStr = '{' + gc + '}';
				var obj = eval('(' + couponsStr + ')');
				var cList = obj.COUPONLIST;
				var allHtml = '';
				if (cList) {
					cList.forEach(function(coupons) {
						allHtml += addHtml(0, coupons);
					})
				}
				document.getElementById("boxs-li_0").innerHTML = allHtml;
			}

			//已领取
			function received() {
				var gc = getMyCoupon(0, 0);
				var couponsStr = '{' + gc + '}';
				var obj = eval('(' + couponsStr + ')');
				var cList = obj.COUPONLIST;
				var allHtml = '';
				if (cList) {
					cList.forEach(function(coupons) {
						allHtml += addHtml(1, coupons);
					})
				}
				document.getElementById("boxs-li_1").innerHTML = allHtml;
			}
			//已使用
			function used() {
				var gc = getMyCoupon(0, 1);
				var couponsStr = '{' + gc + '}';
				var obj = eval('(' + couponsStr + ')');
				var cList = obj.COUPONLIST;
				var allHtml = '';
				if (cList) {
					cList.forEach(function(coupons) {
						allHtml += addHtml(2, coupons);
					})
				}
				document.getElementById("boxs-li_2").innerHTML = allHtml;
			}
			//已过期
			function expired() {
				var gc = getMyCoupon(0, 1);
				var couponsStr = '{' + gc + '}';
				var obj = eval('(' + couponsStr + ')');
				var cList = obj.COUPONLIST;
				var allHtml = '';
				if (cList) {
					cList.forEach(function(coupons) {
						allHtml += addHtml(3, coupons);
					})
				}
				document.getElementById("boxs-li_3").innerHTML = allHtml;
			}
			//去使用
			function go_used() {
				window.location.href = '<%=goOrder%>';
			}

			function addHtml(l, coupons) {
				var bgOrDone = '';
				if (l > 1) {
					bgOrDone = '-done'
				}
				var amount = 0;
				var typeName = '￥';
				var shengyu = '';
				var type = coupons.DEDUCTTYPE;
				if (type == 0) {
					//amount = (coupons.DEDUCTTYPEVALUE/100).toFixed(2);
					amount = coupons.DEDUCTTYPEVALUE / 100;
					if (coupons.EXCHANGENUMBER > 1) {
						shengyu = '用户可领' + coupons.EXCHANGENUMBER + '张'
					}
				} else {
					typeName = '折扣';
					amount = (coupons.DEDUCTTYPEVALUE / 10) + '折';
				}
				var h = '                            <li>\n' +
					'                                <div id="c_' + l + '_' + coupons.COUPONID + '" data-type="' + l +
					'" data-coupId="' + coupons.COUPONID + '" class="li-imgs' + l + ' box-btn' + l + ' li-imgs-bg' +
					bgOrDone + ' float' + '">\n' +
					'                                    <div><span class="price-f">' + typeName +
					'</span><span class="price-num">' +
					amount + '</span></div>\n' + '<div class="price-text">' +
					'<marquee class="text1" direction="left" width="170" height="26">' + coupons.PRODUCTNAMES + shengyu +
					'</marquee>' + '<marquee class="text2" direction="left" width="170" height="26">' + coupons
					.PRODUCTNAMES + '</marquee>' + '</div></div>\n' + '</li>';
				return h;
			}

			//用户可领取优惠券集合接口
			function getCanReceiveCoupons() {
				var beforeEncryption = JSON.stringify({
					SERVICECODE: 100036,
					ACCEPTTIME: acceptTime,
					PARAMS: {
						"ITVACCOUNT": userId
					}
				});
				var json = getAjaxReturnJson(beforeEncryption);
				return json;
			}

			//领取优惠券
			function getCoupons(cId) {
				var beforeEncryption = JSON.stringify({
					SERVICECODE: 100034,
					ACCEPTTIME: acceptTime,
					PARAMS: {
						"ITVACCOUNT": userId,
						"COUPONTEMPLATEID": cId
					}
				});
				var json = getAjaxReturnJson(beforeEncryption);
				return json;
			}


			//我的优惠券接口
			function getMyCoupon(ut, os) {
				var beforeEncryption = JSON.stringify({
					SERVICECODE: 100037,
					ACCEPTTIME: acceptTime,
					PARAMS: {
						"ITVACCOUNT": userId,
						"ENDDATE": endDate,
						"USEDSTATUS": ut,
						"OVERDUESTATUS": os
					}
				});
				var json = getAjaxReturnJson(beforeEncryption);
				return json;
			}

			function getAjaxReturnJson(beforeEncryption) {
				beforeEncryption = beforeEncryption.replace(/^(\s|{)+|(\s|})+$/g, '').concat("}");
				console.log("加密REQ_BODY", beforeEncryption)
				var encrypt = encryptByDES(beforeEncryption);
				var paramsData = JSON.stringify({
					REQ_HEAD: {
						APP_ID: APP_ID
					},
					//已加密
					REQ_BODY: {
						ENCRYPTSTR: encrypt
					}
				});
				console.log("请求报文", paramsData)
				var resData = null; //请求返回
				$.ajax({
					type: "POST", //提交方式
					contentType: "application/json",
					url: API_URL,
					data: paramsData,
					dataType: 'json',
					async: false,
					success: function(res) {
						resData = res;
					}
				});

				console.log("返回报文", resData)
				var resCode = resData.RSP_HEAD.RESPONSECODE;
				var decrypt = '';
				if (resCode == '000000') {
					console.log("请求成功")
					var decryptStr = resData.RSP_BODY.ENCRYPTSTR;
					var decrypt = decryptByDES(decryptStr);
					console.log("解密返回报文", decrypt)
					return decrypt;
				} else {
					console.log("请求失败")
					return decrypt;
				}
			}

			//加密
			function encryptByDES(message) {
				var keyHex = CryptoJS.enc.Hex.parse(key);
				var encrypted = CryptoJS.TripleDES.encrypt(message, keyHex, {
					iv: CryptoJS.enc.Hex.parse('0102030405060708'),
					mode: CryptoJS.mode.CBC,
					padding: CryptoJS.pad.Pkcs7
				});
				return encrypted.toString().toUpperCase();
			}

			//解密
			function decryptByDES(ciphertext) {
				var keyHex = CryptoJS.enc.Hex.parse(key);
				var decrypted = CryptoJS.TripleDES.decrypt(ciphertext, keyHex, {
					iv: CryptoJS.enc.Hex.parse('0102030405060708'),
					mode: CryptoJS.mode.CBC,
					padding: CryptoJS.pad.Pkcs7
				});
				return decrypted.toString(CryptoJS.enc.Utf8);
			}

			function backUrl() {
				//测试
				window.location.href = '<%=backUrl%>';
				//生产
				// window.history.go(-1);
			}


			//新增
			//显示移除输入框焦点
			function focusInput(num) {
				var inputId = document.getElementById('inputTICKETNO');
				var targetBox = document.getElementsByClassName("box-btn5");
				if (num == 0) {
					targetBox[0].style.borderColor = '#fff100';
					targetBox[1].style.borderColor = 'transparent';
					inputId.focus()
				} else if(num ==1){
					targetBox[1].style.borderColor = '#fff100';
					targetBox[0].style.borderColor = 'transparent';
					inputId.blur();
					goDuiHuan();
				}
			}
			//去兑换
			function goDuiHuan() {

				var TICKETNO = document.getElementById("inputTICKETNO").value; //兑换码
				console.log("goDuiHuan", TICKETNO)
				if (!TICKETNO) {
					document.getElementById("tipsText").innerHTML = "兑换码为空";
					return
				}
				document.getElementById("inputTICKETNO").value = "";
				document.getElementById("tipsText").innerHTML = "兑换码为" + TICKETNO;
				return;
				var beforeEncryption = JSON.stringify({
					SERVICECODE: 100040,
					ACCEPTTIME: acceptTime,
					PARAMS: {
						"ITVACCOUNT": userId,
						"TICKETNO": TICKETNO,
						"CITYCODE": '<%=CITYCODE%>'
					}
				});
				beforeEncryption = beforeEncryption.replace(/^(\s|{)+|(\s|})+$/g, '').concat("}");
				console.log("加密REQ_BODY", beforeEncryption)
				var encrypt = encryptByDES(beforeEncryption);
				var paramsData = JSON.stringify({
					REQ_HEAD: {
						APP_ID: APP_ID
					},
					//已加密
					REQ_BODY: {
						ENCRYPTSTR: encrypt
					}
				});
				var resData = null; //请求返回
				$.ajax({
					type: "POST", //提交方式
					contentType: "application/json",
					url: API_URL,
					data: paramsData,
					dataType: 'json',
					async: false,
					success: function(res) {
						resData = res;
						var resCode = resData.RSP_HEAD.RESPONSECODE;
						if (resCode == '000000') {
							console.log("请求成功")
							var decryptStr = resData.RSP_BODY.ENCRYPTSTR;
							var decrypt = decryptByDES(decryptStr);
							console.log("解密返回报文", decrypt)
							__debug.print("----------------------去兑换");
							// __debug.print(beforeEncryption);
							// __debug.print(decrypt);
							// __debug.print("----------------------");

							var decryptStr = '{' + decrypt + '}';
							var obj = eval('(' + decryptStr + ')');
							totalCount = obj.ALLTIMES;
							useCount = obj.USEDTIMES;
							verifyCount = totalCount - useCount;
							document.getElementById("yew").innerHTML = verifyCount;
							if (PRIZEID == 1) {
								btn1 = true;
							} else if (PRIZEID == 2) {
								btn2 = true;
							} else if (PRIZEID == 3) {
								btn3 = true;
							} else if (PRIZEID == 4) {
								btn4 = true;
							}
							btnClass();
						} else {
							console.log("请求失败")
						}
					}
				});
			}

		}
	</script>


</html>
