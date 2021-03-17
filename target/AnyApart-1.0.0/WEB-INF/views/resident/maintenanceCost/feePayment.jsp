<!-- 관리비-이번달 관리비 납부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="//cdnw.tworld.co.kr/poc/inc/css/common.css" rel="stylesheet"
	type="text/css">
<link href="//cdnw.tworld.co.kr/poc/inc/css/myt.css" rel="stylesheet"
	type="text/css">
<style>
.paydiv {
	float: left;
	width: 48%;
	padding: 15px;
	background-color: rgb(125 124 134 / 43%);
	margin: 1%;
	height: 250px;
}

.paydivlow {
	float: left;
	width: 50%;
	padding: 15px;
}

.payday {
	margin-top: 25%;
	font-size: 20px;
	color: white;
}

.payMonth {
	width: 150px;
	height: 150px;
	border-radius: 58%;
	align-content: center;
	background: #f9f9f9;
	margin: 6%;
}

.payMonth2 {
	width: 130px;
	height: 130px;
	border-radius: 58%;
	align-content: center;
	background: red;
	margin: 6%;
}

.Month {
	font-size: 18px;
	text-align: center;
	margin-top: 50%;
	margin-left: 0%;
}

.number {
	color: #53a4ea;
	font-size: 45px;
    margin-left: 34%;
}

.costomTd {
	text-align: center;
	height: 185px;
}
.pay{
    margin-right: 5px;
    font-weight: normal;
    font-size: 40px;
    line-height: 48px;
    letter-spacing: -3px;
    vertical-align: -4px;
	color: white;
}

.mainTitle{
  	display: block;
    height: 60px;
    background: #00a49a;
    color: #fff;
    font-size: 18px;
    line-height: 58px;
    text-align: center;
}
.payChoise{
 	display: block;
    height: 60px;
    background: #00a49a;
    color: #fff;
    font-size: 18px;
    line-height: 58px;
    text-align: center;
}
</style>

	<strong class="mainTitle">관리비 고지서</strong>
<div class="feePayMent">
	<div class="paydiv">
		<div class="paydivlow">
			<div class="payMonth">
				<b class="number">${affter.costMonth }</b> <label class="Month">월분</label>
			</div>
		</div>
		<div class="paydivlow">
			<div class="payday">
				<h2
					style="font-weight: bold; font: small-caps bold 24px/1 sans-serif; color: white;">${user.dong }동
					${user.ho} 호</h2>
				<br> 납부마감일: ${affter.costDuedate }
			</div>

		</div>
	</div>
	<div class="paydiv">
		<table class="table-bordered" style="margin: auto; width: 100%;">
			<thead>
				<tr>
					<th class="text-center" style="background-color: #00a49a;color: white;font-size: 20px;
    						font-weight: revert; height: 40px;">납기내</th>
					<th class="text-center" style="background-color: #ea5353; color: white; font-size: 20px;
   							font-weight: revert; height: 40px;">납기후</th>
				</tr>
			<thead>
			<tbody>
				<tr>
					<td class="costomTd"><strong style="color: white;"><span class="pay" id="costPayAF"></span>원</strong></td>
					<td class="costomTd"><strong style="color: white;"><span class="pay" id="costPayBF"></span>원</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="paymentCon">
		<dl>
			<dt class="titDep2">요금 항목별 상세내역</dt>
			<dd>
				<div class="amountList">
					<strong class="dtTit1_1">항목별 상세요금</strong>
					<dl>
						<dt>
							<span> <em>공동관리비</em> <strong><span class="en" id="comCost">
							${affter.costCommon + 
							affter.costCleaning+
							affter.costDisinfect+
							affter.costSecurity+
							affter.costElevator+
							affter.costAs+
							affter.costCouncil+
							affter.costLas+
							affter.costPark
							}</span>원</strong>
							</span>
						</dt>
						<dd>
							<ul>
								<li><strong>일반관리비</strong>
									<ul>
										<li><strong>일반관리비</strong> <em>${affter.costCommon }원</em></li>
									</ul></li>
								<li><strong>용역업체비</strong>
									<ul>
										<li><strong>청소비</strong> <em>${affter.costCleaning }원</em></li>
										<li><strong>소독비</strong> <em>${affter.costDisinfect }원</em></li>
										<li><strong>경비비</strong> <em>${affter.costSecurity }원</em></li>
									</ul></li>
								<li><strong>공동사용비</strong>
									<ul>
										<li><strong>승강기유지비</strong> <em>${affter.costElevator }원</em></li>
										<li><strong>수선유지비</strong> <em>${affter.costAs }원</em></li>
										<li><strong>입주자 대표회의 운영비</strong> <em>${affter.costCouncil }원</em></li>
									</ul></li>
								<li><strong>기타</strong>
									<ul>
										<li><strong>장기수선충당금</strong> <em>${affter.costLas }원</em></li>
										<li><strong>주차비</strong> <em>${affter.costPark }원</em></li>
									</ul></li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>
							<span> <em>에너지 사용비</em> 
									<strong><span class="en" id="engCost">${affter.costCommHeat+
									affter.costCommHotwater+
									affter.costCommElec+
									affter.costCommWater+
									affter.costIndvHeat+
									affter.costIndvHotwater+
									affter.costIndvElec+
									affter.costIndvWater
									}</span>원</strong>
							</span>
						</dt>
						<dd>
							<ul>
								<li><strong>공용사용비</strong>
									<ul>
										<li><strong>난방 공용</strong> <em>${affter.costCommHeat }원</em></li>
										<li><strong>급탕 공용</strong> <em>${affter.costCommHotwater }원</em></li>
										<li><strong>전기 공용</strong> <em>${affter.costCommElec }원</em></li>
										<li><strong>수도 공용</strong> <em>${affter.costCommWater }원</em></li>
									</ul></li>
									<li><strong>전용사용비</strong>
									<ul>
										<li><strong>난방 전용</strong> <em>${affter.costIndvHeat }원</em></li>
										<li><strong>급탕 전용</strong> <em>${affter.costIndvHotwater }원</em></li>
										<li><strong>전기 전용</strong> <em>${affter.costIndvElec }원</em></li>
										<li><strong>수도 전용</strong> <em>${affter.costIndvWater }원</em></li>
									</ul></li>
							</ul>
						</dd>
					</dl>
				</div>
				<!-- 할인내역 -->
				<div class="amountList discount">
					<!-- 할인내역 class="discount" 추가 -->
					<strong class="dtTit1_2">미납 요금 상세내역</strong>
					<dl>
						<dt>
							<span> <em>미납금액</em> <strong><span class="en" id="unpaidCost">0</span>원</strong>
							</span>
						</dt>
						<dd>
							<ul>
								<li><strong>미납 일</strong>
									<ul>
<!-- 										<li><strong>2020년12월</strong> <em>0원</em></li> -->
										<li><strong>-</strong> <em>0원</em></li>
									</ul></li>
							</ul>
						</dd>
					</dl>
				</div>
				<!-- //할인내역 -->
				<div class="txtInfo h20">
					<ul>
						<li>*소수점 금액은 절감하여 표시합니다.</li>
						<li><strong><em class="fColor1">(#)</em>해당 관리비 금액은 관리사무소에서 통계하여 부과한 금액입니다.</strong></li>
					</ul>
				</div>
				<div class="txtInfo h15">
					<ul>
						<li><strong>주차비 기본월정액 이용안내</strong></li>
						<li>새대당 2개 이상일 경우 한 차의 기준 한달의 1만원 씩 부과 됩니다.</li>
					</ul>
				</div>
				<div>
						<form method="post" action="${cPath }/resident/mainenanceCost/kakaopay.do">
							<strong class="payChoise">관리비 납부 하기</strong>
							<input type="hidden" name="costMonth" value="${affter.costMonth}">
							<input type="hidden" name="costYear" value="${affter.costYear }">
						    <button><img alt="" src="${cPath }/images/payment_icon_yellow_medium.png"></button>
						</form>
				</div>
			</dd>
		</dl>
	</div>
</div>
<script type="text/javascript">
	var unpaidCost = $.trim($("#unpaidCost").text());
	var comCost = $.trim($("#comCost").text());
	var engCost = $.trim($("#engCost").text());
	var sumCost = Number(unpaidCost)+Number(engCost)+Number(comCost);
	var sumCostBF= (sumCost* 0.15).toFixed(0);
	var sumCostBFpay = Number(sumCost)+Number(sumCostBF);
	console.log(sumCostBF)
	sumCostBFpay = sumCostBFpay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#costPayBF").text(sumCostBFpay);
	sumCost=sumCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#costPayAF").text(sumCost);
	$("#comCost").text(comCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$("#engCost").text(engCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
</script>