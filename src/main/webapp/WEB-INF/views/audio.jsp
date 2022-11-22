<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/* ����� �÷��̾� CSS */
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

	//��Ʃ�� API iframe ����
	function onYouTubeIframeAPIReady() {
		// ����� �÷��̾� �Ӽ�(�����ư, ����, ����ð�, ���� ��) �ʱ�ȭ
		audioPlayerInit();

		// ��Ʃ�� ������ ���̵�
		var youtube_id = $("#youtube-player").data('id');
		window.YT.ready(function() {
			youTubePlayer1 = new YT.Player('youtube-player', {
				videoId : youtube_id,
				width : '0',
				height : '0',
				playerVars : {
					width : 0,
					height : 0,
					rel : 0, // ��õ���� false
					autoplay : 0, // �ڵ���� false
					controls : 0, // ��Ʈ�ѷ� false
					showinfo : 1,
					loop : 1, // �ݺ���� true
					playlist : youtube_id, // ���� ���� �ݺ������ ���� ������ ID�� �ִ´�.
				},
				events : {
					'onReady' : onPlayerReady, //�ε��Ҷ� �̺�Ʈ ����
					'onStateChange' : onPlayerStateChange
				//�÷��̾� ���� ��ȭ�� �̺�Ʈ����
				}
			}); //youTubePlayer1����
		});
	}

	//��Ʃ�� �÷��̾� ���º�ȭ
	function onPlayerStateChange(event) {

		if (event.data == YT.PlayerState.PLAYING) {
			// �����
			startAudioTimer(); // ����� ����� Ÿ�̸� ����, ����� ����, ����ð� ����
		} else if (event.data == YT.PlayerState.PAUSED) {
			// �Ͻ�����
			stopAudioTimer(); // ����� ����� Ÿ�̸� ����
		} else if (event.data == YT.PlayerState.ENDED) {
			// ����
			togglePlay($(".audio-control-btn.btn-play")); // �����ư ���
			$(".play-time.start").text('00:00'); // Ÿ�̸� ����
			$(".play-time.end").text('00:00');
			$(".play-progress-bar").width(0); // ����� �ʱ�ȭ
		}
	}

	//���ҰŹ�ư ���
	function toggleMute(obj) {
		if (obj.hasClass('btn-volume')) {
			// ���� -> ���Ұ�
			obj.addClass('btn-mute');
			obj.removeClass('btn-volume');
			obj.find('i').attr('class', 'fa fa-volume-off');
		} else if (obj.hasClass('btn-mute')) {
			// ���Ұ� -> ����
			obj.addClass('btn-volume');
			obj.removeClass('btn-mute');
			obj.find('i').attr('class', 'fa fa-volume-up');
		}
	}

	/* ����� ����� ���͹� ����
	 : ��� �ε��� ����
	 : ����ð� ���� ���� ���� */
	function startAudioTimer() {
		//�÷��̾ ������϶� �ǽð���� �ð��� �ʴ����� ���
		var progressBar = $(".play-progress-bar");
		var progress_val = 0; // ��� progress bar ��
		var playtime = 0; // ��� �ð�
		audioTimer = setInterval(function() {
			if (BGM_TYPE == 'YOUTUBE') {
				// youtube ��ũ ������ ���
				// �ش� �������� ������ ���� ����ð��� �����´�.
				currentTime = Math.floor(youTubePlayer1.getCurrentTime());
				// 00:00�� �������� ǥ���ϱ����� ���˺���
				playtime = setTimeFormat(Math.floor(youTubePlayer1
						.getCurrentTime()));
			} else if (BGM_TYPE == 'AUDIO') {
				// �������� ������ ���
				var player = document.getElementById('bgm-audio-player');
				// audio �±׿��� ���� ����ð��� �����´�.
				currentTime = Math.round(player.currentTime);
				// 00:00�� �������� ǥ���ϱ����� ���˺���
				playtime = setTimeFormat(currentTime);
			}

			// ������ ���� ����ð��� progress bar�� ǥ���ϱ����� currentTime����
			// ��� �ϷḦ 100���� ��� ���� ����ð��� ���
			// �Ҽ��� ù��° �ڸ����� ���
			progress_val = (currentTime / maxTime) * 100;
			progress_val = progress_val.toFixed(1);
			$(".play-time.start").text(playtime);
			progressBar.css('width', progress_val + "%");
		}, 1000);
	}

	//����ð� ���亯��
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
	<!-- ����� �÷��̾� HTML -->

	<div class="bgm-wrap">
		<div id="audio-player"></div>
		<div id="youtube-player"></div>
		<div class="audio-box" style="">
			<div class="audio-title-wrap">
				<span id="audio-title"> ����</span>
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
			<div class="text-play-click">�� ��� ��ư�� ������ ������� ����˴ϴ�.</div>
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