<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/* 오디오 플레이어 CSS */
.bgm-wrap {
	position: absolute;
	z-index: 9998;
	top: 145px;
	left: 430px;
	height: 100px
}

.bgm-wrap iframe#youtube-player {
	display: none
}

.bgm-wrap .audio-box {
	width: 337px;
	height: 55px;
	background: #efefef;
	padding: 5px 15px;
	margin: 15px;
	border-radius: 15px;
	color: gray;
	border: solid 0.5px #ddd
}

.bgm-wrap .audio-box .text-play-click {
	margin-top: 10px;
}

.bgm-wrap .audio-title-wrap {
	margin-bottom: 5px;
	margin-top: 3px;
	font-size: 13px;
	font-weight: 500;
	color: #999;
}

.bgm-wrap .audio-box .audio-control-btn {
	display: inline-block;
	font-size: 14px
}

.bgm-wrap .audio-box .audio-control-btn.btn-play {
	width: 12px;
	margin-right: 5px;
	cursor: pointer;
}

.bgm-wrap .audio-box .audio-control-btn.btn-pause {
	width: 12px;
	margin-right: 5px;
	cursor: pointer;
}

.bgm-wrap .play-time {
	display: inline-block;
	margin: 4px;
}

.bgm-wrap .audio-box .play-progress-box {
	display: inline-block;
	font-size: 14px;
	background: #fff;
	width: 120px;
	height: 4px;
	border: solid 0.5px #ddd;
	vertical-align: middle
}

.bgm-wrap .audio-box .play-progress-bar {
	width: 0;
	height: 100%;
	background: gray;
}

.bgm-wrap .audio-box .play-volume-box {
	display: inline-block;
	margin-left: 15px;
}

.bgm-wrap .audio-box .play-volume-slider {
	display: inline-block;
	width: 40px;
	height: 4px;
	vertical-align: middle;
	margin-left: 5px;
}

.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle.ui-state-active
	{
	border: 1px solid #c5c5c5;
	background: gray;
}

.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle {
	width: 10px;
	height: 10px;
	border-radius: 15px
}

.bgm-wrap .block_tool {
	position: absolute;
	top: -50px;
	width: auto
}

.bgm-wrap .block_tool div {
	margin-bottom: 0;
}

.bgm-wrap .block_tool div .block_copy {
	margin-right: 10px;
	margin-left: 10px
}

.bgm-wrap .block_tool div {
	display: inline-block;
	margin-bottom: 10px;
	width: 40px;
	height: 40px;
	text-align: center;
	border-radius: 50%;
	background: #F1F1F1 no-repeat center;
	box-shadow: 3px 3px 8px 0 rgba(0, 0, 0, 0.05);
	cursor: pointer;
}

.bgm-wrap .block_tool .audio_url p {
	position: absolute;
	left: -15px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
}

.bgm-wrap .block_tool .audio_list p {
	position: absolute;
	left: 36px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
}

.bgm-wrap .block_tool .audio_remove p {
	position: absolute;
	left: 83px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
	width: 70px;
}

.bgm-wrap .block_tool div p:after {
	content: "";
	clear: both;
	display: block;
	position: absolute;
	top: -8px;
	width: 40px;
	height: 10px;
	left: 0;
	background: url(../images/section/section-tool-bg.png) no-repeat right
		center;
}

.bgm-wrap .block_tool div:hover {
	background-color: #EB479A
}

.bgm-wrap .block_tool .audio_url {
	background-image: url(../images/block/list-icon.png) !important;
}

.bgm-wrap .block_tool .audio_url:hover {
	background-image: url(../images/block/list-icon-over.png) !important;
}

.bgm-wrap .block_tool .audio_list {
	background-image: url(../images/block/desktop-icon.png);
	margin-right: 10px;
	margin-left: 10px !important;
}

.bgm-wrap .block_tool .audio_list:hover {
	background-image: url(../images/block/desktop-icon-over.png) !important;
}

.bgm-wrap .block_tool .audio_remove {
	background-image: url(../images/block/remove.png) !important;
}

.bgm-wrap .block_tool .audio_remove:hover {
	background-image: url(../images/block/remove-over.png) !important;
}
</style>
<script type="text/javascript">

	//유튜브 API iframe 생성
	function onYouTubeIframeAPIReady() {
		// 오디오 플레이어 속성(재생버튼, 제목, 재생시간, 볼륨 등) 초기화
		audioPlayerInit();

		// 유튜브 동영상 아이디
		var youtube_id = $("#youtube-player").data('id');
		window.YT.ready(function() {
			youTubePlayer1 = new YT.Player('youtube-player', {
				videoId : youtube_id,
				width : '0',
				height : '0',
				playerVars : {
					width : 0,
					height : 0,
					rel : 0, // 추천영상 false
					autoplay : 0, // 자동재생 false
					controls : 0, // 컨트롤러 false
					showinfo : 1,
					loop : 1, // 반복재생 true
					playlist : youtube_id, // 단일 영상 반복재생을 위해 동일한 ID를 넣는다.
				},
				events : {
					'onReady' : onPlayerReady, //로딩할때 이벤트 실행
					'onStateChange' : onPlayerStateChange
				//플레이어 상태 변화시 이벤트실행
				}
			}); //youTubePlayer1셋팅
		});
	}

	//유튜브 플레이어 상태변화
	function onPlayerStateChange(event) {

		if (event.data == YT.PlayerState.PLAYING) {
			// 재생중
			startAudioTimer(); // 오디오 재생시 타이머 시작, 재생바 진행, 재생시간 시작
		} else if (event.data == YT.PlayerState.PAUSED) {
			// 일시정지
			stopAudioTimer(); // 오디오 재생시 타이머 중지
		} else if (event.data == YT.PlayerState.ENDED) {
			// 중지
			togglePlay($(".audio-control-btn.btn-play")); // 재생버튼 토글
			$(".play-time.start").text('00:00'); // 타이머 중지
			$(".play-time.end").text('00:00');
			$(".play-progress-bar").width(0); // 재생바 초기화
		}
	}

	//음소거버튼 토글
	function toggleMute(obj) {
		if (obj.hasClass('btn-volume')) {
			// 볼륨 -> 음소거
			obj.addClass('btn-mute');
			obj.removeClass('btn-volume');
			obj.find('i').attr('class', 'fa fa-volume-off');
		} else if (obj.hasClass('btn-mute')) {
			// 음소거 -> 볼륨
			obj.addClass('btn-volume');
			obj.removeClass('btn-mute');
			obj.find('i').attr('class', 'fa fa-volume-up');
		}
	}

	/* 오디오 재생시 인터벌 시작
	 : 재생 로딩바 시작
	 : 재생시간 포멧 변경 시작 */
	function startAudioTimer() {
		//플레이어가 재생중일때 실시간재생 시간을 초단위로 출력
		var progressBar = $(".play-progress-bar");
		var progress_val = 0; // 재생 progress bar 값
		var playtime = 0; // 재생 시간
		audioTimer = setInterval(function() {
			if (BGM_TYPE == 'YOUTUBE') {
				// youtube 링크 삽입일 경우
				// 해당 동영상의 정보중 현재 재생시간을 가져온다.
				currentTime = Math.floor(youTubePlayer1.getCurrentTime());
				// 00:00의 형식으로 표기하기위해 포맷변경
				playtime = setTimeFormat(Math.floor(youTubePlayer1
						.getCurrentTime()));
			} else if (BGM_TYPE == 'AUDIO') {
				// 음원파일 삽입일 경우
				var player = document.getElementById('bgm-audio-player');
				// audio 태그에서 현재 재생시간을 가져온다.
				currentTime = Math.round(player.currentTime);
				// 00:00의 형식으로 표기하기위해 포맷변경
				playtime = setTimeFormat(currentTime);
			}

			// 가져온 현재 재생시간을 progress bar에 표기하기위해 currentTime가공
			// 재생 완료를 100으로 잡고 현재 재생시간을 계산
			// 소수점 첫번째 자리까지 계산
			progress_val = (currentTime / maxTime) * 100;
			progress_val = progress_val.toFixed(1);
			$(".play-time.start").text(playtime);
			progressBar.css('width', progress_val + "%");
		}, 1000);
	}

	//재생시간 포멧변경
	function setTimeFormat(sec_time) {
		var sec_num = parseInt(sec_time);
		var minutes = Math.floor(sec_num / 60);
		var seconds = sec_num - (minutes * 60);

		if (minutes < 10) {
			minutes = "0" + minutes;
		}
		if (seconds < 10) {
			seconds = "0" + seconds;
		}

		return minutes + ':' + seconds;
	}
</script>
</head>
<body>
	<!-- 오디오 플레이어 HTML -->

	<div class="bgm-wrap">
		<div id="audio-player"></div>
		<div id="youtube-player"></div>
		<div class="audio-box" style="">
			<div class="audio-title-wrap">
				<span id="audio-title"> 제목</span>
			</div>
			<div class="audio-control-btn btn-play">
				<i class="fa fa-play"></i>
			</div>
			<div class="play-time start">00:00</div>
			<div class="play-progress-box">
				<div class="play-progress-bar"></div>
			</div>
			<div class="play-time end">00:00</div>
			<div class="play-volume-box">
				<div class="audio-control-btn btn-volume">
					<i class="fa fa-volume-up"></i>
				</div>
				<div class="play-volume-slider"></div>
			</div>
			<div class="text-play-click">※ 재생 버튼을 눌러야 배경음이 재생됩니다.</div>
		</div>
		<form method='post' id='bgm-upload' name='frmUpload'
			enctype='multipart/form-data' style="display: none">
			<input class="bgm-file-upload" type="file" id="input-file-bgm"
				name="bgmfile" accept="audio/mp3, audio/ogg, audio/wav, audio/oga">
		</form>

		<div class="popup-audio-player" style="display: none">
			<div class="audio-control-btn btn-play">
				<i class="fa fa-play" style=""></i>
			</div>
		</div>
	</div>
</body>
</html>