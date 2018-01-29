<div class="hiddenContent">
		<!-- ==================== SIDEBAR COLLAPSED ==================== -->
		<div id="collapsedSidebarContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<ul class="collapsedSidebarMenu">

					<li class="sublevel"><a href="#">edit profile<i
							class="icon-user"></i></a></li>
					<li class="sublevel"><a href="#">change password<i
							class="icon-lock"></i></a></li>
					<li class="sublevel"><a href="#">logout<i class="icon-off"></i></a></li>
				</ul>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR COLLAPSED ==================== -->
		<!-- ==================== SIDEBAR TASKS ==================== -->
		<div id="tasksContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Tasks</h1></a>
				<h1>Tasks</h1>
				<div class="sidebarInfo">
					<div class="progressTasks"></div>
					<div class="newTasks"></div>
				</div>
				<ul class="tasksList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR TASKS ==================== -->

		<!-- ==================== SIDEBAR NOTIFICATIONS ==================== -->
		<div id="notificationsContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Notifications</h1></a>
				<h1>Notifications</h1>
				<div class="sidebarInfo">
					<div></div>
					<div></div>
				</div>
				<ul class="notificationsList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR NOTIFICATIONS ==================== -->

		<!-- ==================== SIDEBAR MESSAGES ==================== -->
		<div id="messagesContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Messages</h1></a>
				<h1>Messages</h1>
				<div class="sidebarInfo">
					<div></div>
					<div></div>
				</div>
				<ul class="messagesList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR MESSAGES ==================== -->

		<!-- ==================== SIDEBAR SETTINGS ==================== -->
		<div id="settingsContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Settings</h1></a>
				<h1>Settings</h1>
				<ul class="settingsList">
					<li>
						<div class="settingSlider">
							<i class="icon-leaf"></i>
							<h3>Slider</h3>
							<div class="sl1"></div>
						</div>
					</li>
					<li>
						<div class="settingSlider">
							<i class="icon-leaf"></i>
							<h3>RangeSlider</h3>
							<div class="sl2"></div>
						</div>
					</li>
					<li>
						<div class="settingToggler">
							<i class="icon-leaf"></i>
							<h3>Toggler</h3>
							<label class="checkbox toggle well" onclick=""> <input
								id="toggler" type="checkbox" checked /> <span
								class="slider-selection"></span> <span class="toggleStatus">
									<span><i class="icon-ok toggleOn"></i></span> <span><i
										class="icon-remove toggleOff"></i></span>
							</span> <a class="btn btn-primary slide-button"></a>
							</label>
						</div>
					</li>

					<li class="fontSize">
						<h2>Font Size</h2>
						<div class="fontSizeBlock fontSizeSmall active">
							<span>A</span>
						</div>
						<div class="fontSizeBlock fontSizeMedium">
							<span>A</span>
						</div>
						<div class="fontSizeBlock fontSizeBig">
							<span>A</span>
						</div>
					</li>

					<li class="fontStyle">
						<h2>Font Style</h2>
						<div class="fontStyleBlock fontStyleSansSerif active">
							<span>Aa</span>
						</div>
						<div class="fontStyleBlock fontStyleSerif">
							<span>Aa</span>
						</div>
					</li>

				</ul>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR SETTINGS ==================== -->

		<!-- ==================== SIDEBAR PROFILE ==================== -->
		<div id="profileContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>My account</h1></a>
				<h1>My account</h1>
				<div class="profileBlock">
					<div class="profilePhoto">
						<div class="usernameHolder">

							<%
								if (session.getAttribute("tst") != null) {
							%>
							<jsp:getProperty property="username" name="ut9" />
							<%
								}
							%>
						</div>
					</div>
					<div class="profileInfo"></div>
					<footer>
						<div class="profileSettingBlock editProfile">
							<i class="icon-user"></i>edit profile
						</div>
						<div class="profileSettingBlock changePassword">
							<i class="icon-lock"></i>change password
						</div>

						<div class="profileSettingBlock logout">
							<a href="../GestionPointage?action=logout"><i
								class="icon-off"></i></a>logout
						</div>

					</footer>
				</div>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR PROFILE ==================== -->
	</div>
