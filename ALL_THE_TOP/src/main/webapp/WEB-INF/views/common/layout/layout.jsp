<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko" class="is-laptop" style="-scrollbar-width: 17px;">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="${contextPath}/resources/bootstrap/img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${contextPath}/resources/bootstrap/img/favicon.ico" type="image/x-icon">
    <title>ALLTT</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <style data-emotion="css" data-s=""></style>
    <script src="${contextPath}/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<style class="vjs-styles-defaults">
.video-js {
	width: 300px;
	height: 150px;
}

.vjs-fluid {
	padding-top: 56.25%
}
</style>
<title>ALLTT</title>
<meta name="viewport" content="minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no, user-scalable=no, viewport-fit=cover">
<meta name="next-head-count" content="4">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="naver-site-verification" content="8679cb22ec6174d8425b81da2de167a93b030e21">
<meta name="google-site-verification" content="dBwS2zOYsVFXyK3mI3v0DOw7W8dAJYiy2btCLOZ8-Us">
<meta name="facebook-domain-verification" content="m70klk6wdiueg8fhnxanzbyn69h4fe">
<style id="__jsx-288906432">
#nprogress {
	pointer-events: none;
}

#nprogress .bar {
	background: #ff153c;
	position: fixed;
	z-index: 9999;
	top: 0;
	left: 0;
	width: 100%;
	height: 3px;
}

#nprogress .peg {
	display: block;
	position: absolute;
	right: 0px;
	width: 100px;
	height: 100%;
	box-shadow: 0 0 10px #ff153c, 0 0 5px #ff153c;
	opacity: 1;
	-webkit-transform: rotate(3deg) translate(0px, -4px);
	-ms-transform: rotate(3deg) translate(0px, -4px);
	-webkit-transform: rotate(3deg) translate(0px, -4px);
	-ms-transform: rotate(3deg) translate(0px, -4px);
	transform: rotate(3deg) translate(0px, -4px);
}

#nprogress .spinner {
	display: block;
	position: fixed;
	z-index: 1031;
	top: 15px;
	right: 15px;
}

#nprogress .spinner-icon {
	width: 18px;
	height: 18px;
	box-sizing: border-box;
	border: solid 2px transparent;
	border-top-color: #ff153c;
	border-left-color: #ff153c;
	border-radius: 50%;
	-webkit-animation: nprogresss-spinner 400ms linear infinite;
	-webkit-animation: nprogress-spinner 400ms linear infinite;
	animation: nprogress-spinner 400ms linear infinite;
}

.nprogress-custom-parent {
	overflow: hidden;
	position: relative;
}

.nprogress-custom-parent #nprogress .spinner, .nprogress-custom-parent #nprogress .bar
	{
	position: absolute;
}

@
-webkit-keyframes nprogress-spinner { 0%{
	-webkit-transform: rotate(0deg);
}

100%{
-webkit-transform


:rotate(360deg)


;
}
}
@
-webkit-keyframes nprogress-spinner { 0%{
	-webkit-transform: rotate(0deg);
	-ms-transform: rotate(0deg);
	transform: rotate(0deg);
}

100%{
-webkit-transform


:rotate(360deg)


;
-ms-transform


:rotate(360deg)


;
transform


:rotate(360deg)


;
}
}
@
keyframes nprogress-spinner { 0%{
	-webkit-transform: rotate(0deg);
	-ms-transform: rotate(0deg);
	transform: rotate(0deg);
}
100%{
-webkit-transform


:rotate(360deg)


;
-ms-transform


:rotate(360deg)


;
transform


:rotate(360deg)


;
}
}
</style>
<style data-emotion="css" data-s=""></style>
<style data-emotion="css " data-s=""></style>
<style data-emotion="css vfh4pc" data-s="">
.css-vfh4pc {
	position: fixed;
	top: 0;
	z-index: 200;
	left: 0;
	right: 0;
	width: calc(100vw - var(--scrollbar-width));
	height: 5rem;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: start;
	-ms-flex-pack: start;
	-webkit-justify-content: flex-start;
	justify-content: flex-start;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	box-sizing: border-box;
	top: 0;
	background-image: initial;
}

@media ( min-width : 768px) {
	.css-vfh4pc {
		height: 5.833rem;
	}
}

.css-vfh4pc:before {
	content: '';
	position: absolute;
	z-index: -1;
	top: -1px;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-backdrop-filter: blur(0px);
	backdrop-filter: blur(0px);
	background-image: linear-gradient(to bottom, rgba(54, 0, 102, 0),
		rgba(54, 0, 102, 0));
	color: rgba(255, 255, 255, 1);
	-webkit-transition: backdrop-filter 0.3s linear, background-color 0.3s
		linear;
	transition: backdrop-filter 0.3s linear, background-color 0.3s linear;
	background-color: rgba(0, 0, 0, 1);
}

.css-vfh4pc>a {
	margin-right: 2rem;
	color: rgba(255, 255, 255, 1);
	opacity: 0.87;
	font-size: 1.333rem;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
}

.css-vfh4pc>a:first-of-type {
	display: block;
	margin: 0;
	height: 100%;
	margin: 0 3.083rem 0 0;
	opacity: 1;
}

.css-vfh4pc>a.other {
	opacity: 0.64;
}

.css-vfh4pc>a:hover {
	opacity: 1;
}

.css-vfh4pc>a.on {
	font-weight: 700;
	opacity: 1;
}

.css-vfh4pc>a.on .live:before {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cdefs%3E%3Cstyle%3E .cls-1,.cls-6%7Bfill:none%7D.cls-2,.cls-6%7Bstroke:%23fff;stroke-linejoin:round%7D.cls-2%7Bfill:%23fff;stroke-width:.6px%7D.cls-6%7Bstroke-linecap:round;stroke-width:1.8px%7D %3C/style%3E%3C/defs%3E%3Cg id='icon_menu_live' transform='translate(2 2.393)'%3E%3Cpath id='area' class='cls-1' transform='translate(-2 -2.393)' d='M0 0h24v24H0z'/%3E%3Cg id='icon' transform='translate(-2 .58)'%3E%3Cg id='LIVE' transform='translate(4.6 8.423)'%3E%3Cpath id='패스_1422' data-name='패스 1422' class='cls-2' d='M900.019 37.073h-3.165v-5.1h.792v4.413h2.374z' transform='translate(-896.854 -31.974)'/%3E%3Cpath id='패스_1423' data-name='패스 1423' class='cls-2' d='M900.752 37.073v-5.1h.792v5.1z' transform='translate(-896.54 -31.974)'/%3E%3Cpath id='패스_1424' data-name='패스 1424' class='cls-2' d='m904.117 37.073-1.819-5.1h.859l1.388 4.208h.022l1.392-4.208h.845l-1.82 5.1z' transform='translate(-896.249 -31.974)'/%3E%3Cpath id='패스_1425' data-name='패스 1425' class='cls-2' d='M910.574 37.073h-3.236v-5.1h3.236v.682h-2.444v1.491h2.314v.654h-2.314v1.583h2.444z' transform='translate(-895.737 -31.974)'/%3E%3C/g%3E%3Cg id='TV' style='opacity:.997'%3E%3Cg id='사각형_2321' data-name='사각형 2321' transform='translate(0 3.025)' style='opacity:.998;stroke-linecap:round;stroke-width:1.8px;stroke:%23fff;stroke-linejoin:round;fill:none'%3E%3Crect width='24' height='16' rx='3' style='stroke:none'/%3E%3Crect class='cls-1' x='.9' y='.9' width='22.2' height='14.2' rx='2.1'/%3E%3C/g%3E%3Cg id='antennae' transform='translate(8.671 .527)' style='opacity:.998'%3E%3Cpath id='선_34' data-name='선 34' class='cls-6' transform='translate(-.471)' d='M3.055 3 0 0'/%3E%3Cpath id='선_35' data-name='선 35' class='cls-6' transform='translate(4.024)' d='m0 3 3.055-3'/%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E%0A");
}

.css-vfh4pc .live {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}

.css-vfh4pc .live::before {
	content: '';
	display: inline-block;
	position: relative;
	top: 0px;
	margin-right: 0.417rem;
	width: 2rem;
	height: 2rem;
	background-repeat: no-repeat;
	-webkit-background-size: contain;
	background-size: contain;
}
</style>
<style data-emotion="css 116irpw" data-s="">
.css-116irpw {
	width: 15.333rem;
	height: 100%;
	background-repeat: no-repeat;
	-webkit-background-position: 0 50%;
	background-position: 0 50%;
	-webkit-background-size: 100% auto;
	background-size: 100% auto;
	font-size: 1rem;
	text-indent: -9999px;
	background-image: url('${contextPath}/resources/bootstrap/img/logo.png');
}

@media ( max-width : 767px) {
	.css-116irpw {
		width: 6.216rem;
	}
}
</style>
<style data-emotion="css 13co1xy" data-s="">
.css-13co1xy {
	margin-left: auto;
	position: relative;
	display: none;
	-webkit-box-pack: left;
	-ms-flex-pack: left;
	-webkit-justify-content: left;
	justify-content: left;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-align-self: right;
	-ms-flex-item-align: right;
	align-self: right;
}

@media ( min-width : 280px) {
	.css-13co1xy {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
	}
}

.css-13co1xy .menu_my {
	position: relative;
	width: 2.333rem;
	height: 2.333rem;
}

.css-13co1xy .menu_my:before {
	content: '';
	position: absolute;
	top: -1em;
	left: -1em;
	right: -1em;
	bottom: -1em;
	background-color: transparent;
	z-index: -1;
}

.css-13co1xy .menu_my .profile_img {
	position: relative;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 4px;
	overflow: hidden;
	cursor: pointer;
}

.css-13co1xy .menu_my .profile_img>picture:before {
	-webkit-background-size: 100%;
	background-size: 100%;
}

.css-13co1xy .menu_my .profile_img>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.css-13co1xy .menu_my .profile_info {
	display: none;
}

.css-13co1xy .menu_my:hover+.menu_my_content {
	visibility: visible;
	opacity: 1;
	-webkit-transform: translate(0, 0);
	-moz-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	transform: translate(0, 0);
	-webkit-transition: visibility 0s linear 0s, opacity 0.2s,
		-webkit-transform 0.2s;
	transition: visibility 0s linear 0s, opacity 0.2s, transform 0.2s;
}

.css-13co1xy .menu_my_content {
	position: fixed;
	top: 5rem;
	right: 1.333rem;
	min-width: 20rem;
	box-sizing: border-box;
	margin-top: -2px;
	padding: 1.5rem 0 1.167rem;
	opacity: 1;
	border-radius: 2px;
	box-shadow: 0px 5px 10px 0 rgba(0, 0, 0, 0.5);
	border: solid 1px #4d4d4d;
	background-color: #212121;
	visibility: hidden;
	opacity: 0;
	-webkit-transition: visibility 0s linear 0.2s, opacity 0.2s,
		-webkit-transform 0.2s;
	transition: visibility 0s linear 0.2s, opacity 0.2s, transform 0.2s;
	-webkit-transform: translate(0, -10px);
	-moz-transform: translate(0, -10px);
	-ms-transform: translate(0, -10px);
	transform: translate(0, -10px);
}

@media ( min-width : 768px) {
	.css-13co1xy .menu_my_content {
		top: 5.833rem;
		right: 3.888rem;
	}
}

.css-13co1xy .menu_my_content:hover {
	visibility: visible;
	opacity: 1;
	-webkit-transform: translate(0, 0);
	-moz-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	transform: translate(0, 0);
	-webkit-transition: visibility 0s linear 0s, opacity 0.2s,
		-webkit-transform 0.2s;
	transition: visibility 0s linear 0s, opacity 0.2s, transform 0.2s;
}

.css-13co1xy .menu_my_content:before {
	content: '';
	position: absolute;
	top: -1em;
	left: -1em;
	right: -1em;
	bottom: -1em;
	background-color: transparent;
	z-index: -1;
}

.css-13co1xy .menu_my_content .profile {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	padding: 0 1.667rem;
}

.css-13co1xy .menu_my_content .profile_img {
	width: 3.5rem;
	height: 3.5rem;
	border-radius: 4px;
	overflow: hidden;
	background-color: rgba(255, 255, 255, 0.1);
}

.css-13co1xy .menu_my_content .profile_img>picture {
	position: relative;
	display: block;
	height: 100%;
}

.css-13co1xy .menu_my_content .profile_img>picture:before {
	-webkit-background-size: 100%;
	background-size: 100%;
}

.css-13co1xy .menu_my_content .profile_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.css-13co1xy .menu_my_content .profile_info {
	min-width: 70%;
	padding-left: 1.25rem;
}

.css-13co1xy .menu_my_content .profile_info_name {
	width: 100%;
	word-wrap: break-word;
	text-overflow: ellipsis;
	font-size: 1.25rem;
	font-weight: 500;
	white-space: nowrap;
	word-break: keep-all;
}

.css-13co1xy .menu_my_content .profile_info_change {
	font-size: 0.81em;
	padding-top: 0.333rem;
	font-size: 1rem;
	color: #a3a3a3;
	-webkit-transition: color 0.1s;
	transition: color 0.1s;
}

.css-13co1xy .menu_my_content .profile_info_change::after {
	content: '';
	display: inline-block;
	margin-left: 0.3em;
	width: 0.95em;
	height: 0.95em;
	-webkit-transform: translate3d(0, 0.1em, 0);
	-moz-transform: translate3d(0, 0.1em, 0);
	-ms-transform: translate3d(0, 0.1em, 0);
	transform: translate3d(0, 0.1em, 0);
	background-image:
		url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6.2 11'%3E%3Cpath fill='%237f7f7f' d='M6 5.7L.7 11l-.7-.7 4.8-4.8L0 .7.7 0 6 5.3l.2.2-.2.2z'/%3E%3C/svg%3E");
	-webkit-background-size: contain;
	background-size: contain;
	-webkit-background-position: 50% 0;
	background-position: 50% 0;
	background-repeat: no-repeat;
}

.css-13co1xy .menu_my_content .profile_info_change:hover {
	color: #dedede;
}

.css-13co1xy .menu_my_content .profile_info_change:hover::after {
	content: '';
	display: inline-block;
	margin-left: 0.3em;
	width: 0.95em;
	height: 0.95em;
	-webkit-transform: translate3d(0, 0.1em, 0);
	-moz-transform: translate3d(0, 0.1em, 0);
	-ms-transform: translate3d(0, 0.1em, 0);
	transform: translate3d(0, 0.1em, 0);
	background-image:
		url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6.2 11'%3E%3Cpath fill='%23dedede' d='M6 5.7L.7 11l-.7-.7 4.8-4.8L0 .7.7 0 6 5.3l.2.2-.2.2z'/%3E%3C/svg%3E");
	-webkit-background-size: contain;
	background-size: contain;
	-webkit-background-position: 50% 0;
	background-position: 50% 0;
	background-repeat: no-repeat;
}

.css-13co1xy .menu_my_content hr {
	width: auto;
	margin: 1.667rem 0 1.167rem;
	border-width: 1px 0 0 0;
	border-color: #2e2e2e;
}

.css-13co1xy .menu_my_btn_wrap {
	font-size: inherit;
}

.css-13co1xy .menu_my_btn_wrap a {
	display: inline-block;
	width: 100%;
	padding: 0.5rem 1.667rem;
	font-size: 1.25rem;
	line-height: 1.5;
	color: #a3a3a3;
	-webkit-transition: color 0.1s;
	transition: color 0.1s;
}

.css-13co1xy .menu_my_btn_wrap a:hover {
	background-color: #2e2e2e;
	color: rgba(255, 255, 255, 1);
}
</style>
<style data-emotion="css xyumn" data-s="">
.css-xyumn {
	margin-right: 2.333rem;
	width: 2.333rem;
	height: 2.333rem;
	-webkit-background-size: 100%;
	background-size: 100%;
	background-repeat: no-repeat;
	-webkit-background-position: center;
	background-position: center;
	opacity: 0.7;
	font-size: 1rem;
	text-indent: -9999px;
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
}

.css-xyumn.on {
	opacity: 0.9;
}

.css-xyumn:hover {
	opacity: 1;
}
</style>
<style data-emotion="css p5l6tq" data-s="">
.css-p5l6tq {
	margin-top: 5rem;
}

@media ( min-width : 768px) {
	.css-p5l6tq {
		margin-top: 5.833rem;
	}
}
</style>
<style data-emotion="css 1q9y9ts" data-s="">
.css-1q9y9ts {
	display: none;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 33.33vw;
	min-height: auto;
	max-height: auto;
	z-index: 99999;
	font-size: 12px;
}

@media ( max-width : 767px) {
	.css-1q9y9ts {
		width: 50%;
		min-width: 300px;
	}
}

@media ( min-width : 768px) {
	.css-1q9y9ts {
		width: 40%;
	}
}

@media ( min-width : 1200px) {
	.css-1q9y9ts {
		width: 33.33vw;
	}
}

.css-1q9y9ts:before {
	content: '';
	display: block;
	padding-top: 56.25%;
	float: left;
	box-sizing: inherit;
}

.css-1q9y9ts:after {
	content: '';
	display: block;
	clear: both;
}
</style>
<style data-emotion="css 1vwv60f" data-s="">
.css-1vwv60f {
	position: relative;
	max-height: auto;
	height: auto;
	margin-top: 0em;
	z-index: 10;
	display: none;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 33.33vw;
	min-height: auto;
	max-height: auto;
	z-index: 99999;
	font-size: 12px;
}

.css-1vwv60f button {
	outline: 0;
}

.css-1vwv60f .player {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #000;
	outline: 0;
}

.css-1vwv60f .player>div.pp {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.css-1vwv60f .player>div.test-over {
	position: absolute;
	top: 1em;
	right: 1em;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-flex-wrap: wrap;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	z-index: 10;
}

.css-1vwv60f>span {
	width: 30%;
	padding: 1em;
	word-break: break-all;
	font-size: 10px;
}

.css-1vwv60f #test {
	position: absolute;
	width: 100%;
}

.css-1vwv60f #test .player-wrap {
	position: absolute;
}

.css-1vwv60f #test .player-wrap>div:first-of-type>div {
	position: absolute;
	width: 100%;
	height: 100%;
}

.css-1vwv60f #test .player-wrap>div:first-of-type>div>div {
	position: absolute;
	width: 100%;
	height: 100%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: stretch;
	-ms-flex-pack: stretch;
	-webkit-justify-content: stretch;
	justify-content: stretch;
	-webkit-align-items: stretch;
	-webkit-box-align: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
}

.css-1vwv60f #test .player-wrap+div {
	display: none;
}

.css-1vwv60f #test .player-wrap+div+div {
	display: none;
}

.css-1vwv60f #test .content {
	display: none;
}

@media ( max-width : 767px) {
	.css-1vwv60f {
		width: 50%;
		min-width: 300px;
	}
}

@media ( min-width : 768px) {
	.css-1vwv60f {
		width: 40%;
	}
}

@media ( min-width : 1200px) {
	.css-1vwv60f {
		width: 33.33vw;
	}
}

.css-1vwv60f:before {
	content: '';
	display: block;
	padding-top: 56.25%;
	float: left;
	box-sizing: inherit;
}

.css-1vwv60f:after {
	content: '';
	display: block;
	clear: both;
}
</style>
<style data-emotion="css 1t755np" data-s="">
.css-1t755np {
	position: relative;
	height: 0;
	padding-bottom: calc(44.5vw);
	box-sizing: border-box;
	background: linear-gradient(to bottom, #121212, #121212 60%, rgba(0, 0, 0, 0));
	width: 100%;
	margin-top: -5rem;
}

.css-1t755np:after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	object-fit: cover;
	width: 100%;
	height: 100%;
	background-image: url('/img/tving-empty.svg');
	-webkit-background-position: center;
	background-position: center;
	-webkit-background-size: 20rem;
	background-size: 20rem;
	background-repeat: no-repeat;
}

@media ( min-width : 768px) {
	.css-1t755np {
		margin-top: -5.833rem;
	}
}

.css-1t755np>div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.css-1t755np+section {
	margin-top: -5rem;
	z-index: 1;
}

@media ( max-width : 767px) {
	.css-1t755np+section {
		margin-top: 0;
	}
}

.css-1t755np .swiper {
	height: 100%;
	overflow: visible;
}

.css-1t755np .swiper-button-prev {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	opacity: 0.5;
	background-repeat: no-repeat;
	-webkit-background-size: 100% auto;
	background-size: 100% auto;
	-webkit-background-position: 50% 50%;
	background-position: 50% 50%;
	width: 1.333rem;
	height: 100%;
	font-size: 0;
	margin: 0;
	padding: 0;
	z-index: 10;
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
	cursor: pointer;
	left: 0;
	background-image: url('/img/icon_slide_left.svg');
}

@media ( min-width : 768px) {
	.css-1t755np .swiper-button-prev {
		width: 3.888rem;
	}
}

.css-1t755np .swiper-button-prev.active, .css-1t755np .swiper-button-prev:hover
	{
	opacity: 1;
}

.css-1t755np .swiper-button-next {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	opacity: 0.5;
	background-repeat: no-repeat;
	-webkit-background-size: 100% auto;
	background-size: 100% auto;
	-webkit-background-position: 50% 50%;
	background-position: 50% 50%;
	width: 1.333rem;
	height: 100%;
	font-size: 0;
	margin: 0;
	padding: 0;
	z-index: 10;
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
	cursor: pointer;
	right: 0;
	background-image: url('/img/icon_slide_right.svg');
}

@media ( min-width : 768px) {
	.css-1t755np .swiper-button-next {
		width: 3.888rem;
	}
}

.css-1t755np .swiper-button-next.active, .css-1t755np .swiper-button-next:hover
	{
	opacity: 1;
}

.css-1t755np .pagination {
	position: absolute;
	bottom: 11em;
	left: 4vw;
	z-index: 100;
	top: auto;
	right: auto;
	text-align: left;
	margin-left: 0;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}

.css-1t755np .swiper-pagination {
	position: absolute;
	bottom: 20%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	z-index: 100;
	top: auto;
	right: auto;
	text-align: left;
	margin-left: 1.666rem;
	left: 1.333rem;
}

@media ( min-width : 768px) {
	.css-1t755np .swiper-pagination {
		left: 3.888rem;
	}
}

@media ( max-width : 767px) {
	.css-1t755np .swiper-pagination {
		bottom: 3.5rem;
	}
}

.css-1t755np .swiper-pagination .swiper-pagination-bullet {
	position: relative;
	display: block;
	background-color: rgba(255, 255, 255, 0.3);
	cursor: pointer;
	width: 0.667rem;
	height: 0.667rem;
	margin: 0.333rem;
	border-radius: 9999px;
}

.css-1t755np .swiper-pagination .swiper-pagination-bullet-active {
	background-color: rgba(255, 255, 255, 1);
}

.css-1t755np .banner_btn_all {
	position: absolute;
	left: 4.5vw;
	bottom: 7vw;
	z-index: 1;
}

.css-1t755np .btn_page_go {
	border: 1px solid rgba(255, 255, 255, 0.5);
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-backdrop-filter: blur(200px);
	backdrop-filter: blur(200px);
	border-radius: 0.15em;
}
</style>
<style data-emotion="css" data-s=""></style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<tiles:insertAttribute name="header"/>
    <!-- Header End -->

	<!-- Content Section Begin -->
	<tiles:insertAttribute name="body"/>
	<!-- Content Section End -->

	<!-- Footer Section Begin -->
	<tiles:insertAttribute name="footer"/>
	<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/player.js"></script>
<script src="${contextPath}/resources/bootstrap/js/jquery.nice-select.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/mixitup.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/jquery.slicknav.js"></script>
<script src="${contextPath}/resources/bootstrap/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/main.js"></script>


</body>

</html>