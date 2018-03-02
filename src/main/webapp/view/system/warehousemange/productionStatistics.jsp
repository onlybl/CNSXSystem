<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>" />
<link rel="stylesheet"
	href="dependicyLibraries/css/bootstrap3.3.7cssbootstrap.min.css">
<link rel="stylesheet"
	href="dependicyLibraries/css/font-awesome.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="dependicyLibraries/jquery2.1.1jquery.min.js"></script>
<script src="dependicyLibraries/bootstrap3.3.7jsbootstrap.min.js"></script>
<script src="assets/dist/echarts.js"></script>
<title>产品流量流量统计</title>
</head>
<body>
	<div class="page-content clearfix">
		<div class="state-overview clearfix">
			<div class="col-lg-3 col-sm-6">
				<section class="panel">
					<div class="symbol terques">
						<i class="icon-user"></i>
					</div>
					<div class="value">
						<h1 id="scyh">0000</h1>
						<p>商城用户</p>
					</div>

				</section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel">
					<div class="symbol red">
						<i class="icon-tags"></i>
					</div>
					<div class="value">
						<h1 id="fhzl">0000</h1>
						<p>发货总量</p>
					</div>
				</section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel">
					<div class="symbol yellow">
						<i class="icon-shopping-cart"></i>
					</div>
					<div class="value">
						<h1 id="ddzs">345</h1>
						<p>订单总数</p>
					</div>
				</section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel">
					<div class="symbol blue">
						<i class="icon-bar-chart"></i>
					</div>
					<div class="value">
						<h1>
							￥<span id="jyjl">0000</span>
						</h1>
						<p>交易记录</p>
					</div>
				</section>
			</div>
		</div>
		<!--实时交易记录-->
		<div class="clearfix">
			<div class="t_Record">
				<div id="main"
					style="height: 300px; overflow: hidden; width: 100%; overflow: auto"></div>
			</div>
			<div class="news_style">
				<div class="title_name">最新消息</div>
				<ul class="list">
					<li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
					<li><i class="icon-bell red"></i><a href="#">6月共处理订单3451比，作废为...</a></li>
					<li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
					<li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
					<li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
				</ul>
			</div>
		</div>

		<script type="text/javascript">
			var myChart;
			$(document).ready(function() {

				$(".t_Record").width($(window).width() - 320);
				//当文档窗口发生改变时 触发  
				$(window).resize(function() {
					$(".t_Record").width($(window).width() - 320);
				});
			});

			require.config({
				paths : {
					echarts : './assets/dist'
				}
			});
			require([ 'echarts', 'echarts/theme/macarons',
					'echarts/chart/line', // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
					'echarts/chart/bar' ], function(ec, theme) {
				myChart = ec.init(document.getElementById('main'), theme);
				optionmaster();
				countofsight();
			});

			function countofsight() {
				$.ajax({
					url : "Statistics/surfaceStatistics.html",
					type : "post",
					dataType : "json",
					data : {},
					success : function(json) {
						$("#scyh").text(json.a);//商城用户
						$("#fhzl").text(json.b);//发货总量
						$("#ddzs").text(json.c);//订单总数
						$("#jyjl").text(json.d);//交易记录
					},
					error : function(i) {
					}
				});
			}

			function optionmaster() {
				$.ajax({
					url : "Statistics/loadstatstics.html",
					type : "post",
					dataType : "json",
					data : {},
					success : function(inf) {
						var json = inf[0];
						option = {
							title : {
								text : '月购买订单交易记录',
								subtext : '刷新获取最新用户订单购买记录'
							},
							tooltip : {
								trigger : 'axis'
							},
							legend : {
								data : [ '今年', '去年' ]
							},
							toolbox : {
								show : true,
								feature : {
									mark : {
										show : true
									},
									dataView : {
										show : true,
										readOnly : false
									},
									magicType : {
										show : true,
										type : [ 'line', 'bar' ]
									},
									restore : {
										show : true
									},
									saveAsImage : {
										show : true
									}
								}
							},
							calculable : true,
							xAxis : [ {
								type : 'category',
								data : [ '1月', '2月', '3月', '4月', '5月', '6月',
										'7月', '8月', '9月', '10月', '11月', '12月' ]
							} ],
							yAxis : [ {
								type : 'value'
							} ],
							series : [

							{
								name : '今年',
								type : 'bar',
								data : json.data,
							}, {
								name : '去年',
								type : 'bar',
								data : json.last,
							} ]
						};
						myChart.setOption(option);
					},
					error : function(i) {
					}
				});
			}
		</script>
	</div>
</body>
</html>