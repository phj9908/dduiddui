<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/tap.css">
    <link rel="stylesheet" type="text/css" href="css/board.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/memberInfo.css">-->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
    <div class="card-body bg-white mt-0 shadow">
        <p style="font-weight: bold">카카오페이로 결제하기</p>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span>1,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
        <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 1,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
        <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
    </div>
</body>

<script>
    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp12527413');
        var money = $("input:radio[name='cp_item']:checked").val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명 : 주문명 설정',
            amount: money,
            buyer_email: 'ex@naver.com',
            buyer_name: 'ddddd',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                window.close();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);

        });
    });
</script>