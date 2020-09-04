//
//  ChatViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/09/02.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import SendBirdUIKit

class ChatViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        SBUMain.connect { _,_  in
            SBUStringSet.ChannelList_Header_Title = "채팅"
            SBUStringSet.OK = "확인"
            SBUStringSet.Invite = "초대"
            SBUStringSet.Camera = "카메라"
            SBUStringSet.PhotoVideoLibrary = "사진 라이브러리"
            SBUStringSet.Document = "파일"
            SBUStringSet.ChannelSettings_Notifications = "알림"
            SBUStringSet.ChannelSettings_Members_Title = "대화 상대"
            SBUStringSet.ChannelSettings_Leave = "대화 나가기"
            SBUStringSet.Edit = "설정"
            SBUStringSet.ChannelSettings_Change_Name = "채팅방 이름 변경"
            SBUStringSet.ChannelSettings_Change_Image = "체팅방 이미지 변경"
            SBUStringSet.ChannelSettings_Header_Title = "채팅방 정보"
            SBUStringSet.MemberList_Header_Title = "대화 상대"
            SBUStringSet.Cancel = "취소"
            SBUStringSet.InviteChannel_Header_Title = "대화 상대 초대"
            SBUStringSet.MessageInput_Text_Placeholder = "메시지 입력"
            SBUStringSet.MemberList_Header_Title = ""
            SBUStringSet.MemberList_Me = "(나)"
            SBUStringSet.Empty_No_Messages = "메시지 없음"
            SBUStringSet.Date_Yesterday = "어제"
            SBUStringSet.Channel_Header_LastSeen = "마지막 접속"
            SBUStringSet.Date_Ago = "전"
            SBUStringSet.ChannelSettings_Moderations = "채팅방 관리"
            SBUStringSet.ChannelSettings_Operators = "관리자"
            SBUStringSet.ChannelSettings_Muted_Members = "차단된 사용자"
            SBUStringSet.ChannelSettings_Banned_Members = "강퇴된 사용자"
            SBUStringSet.MemberList_Title_Operators = "관리자"
            SBUStringSet.MemberList_Title_Muted_Members = "차단된 사용자"
            SBUStringSet.MemberList_Title_Banned_Members = "강퇴된 사용자"
            SBUStringSet.Empty_No_Muted_Members = "차단된 사용자 없음"
            SBUStringSet.Empty_No_Banned_Members = "강퇴된 사용자 없음"
            SBUStringSet.User_Operator = "관리자"
            SBUStringSet.MemberList_Dismiss_Operator = "관리자 해임"
            SBUStringSet.CreateChannel_Header_Select_Members = "대화 상대 선택"
            SBUStringSet.ChannelSettings_Enter_New_Name = "이름 입력"
            SBUStringSet.ChannelSettings_Freeze_Channel = "채팅방 얼리기"
            SBUStringSet.MemberList_Title_Members = "대화 상대"
            SBUStringSet.MemberList_Mute = "차단"
            SBUStringSet.MemberList_Ban = "강퇴"
            SBUStringSet.MemberList_Promote_Operator = "관리자 위임"
            SBUStringSet.MemberList_Unban = "강퇴 취소"
            SBUStringSet.Channel_Name_No_Members = "대화 상대 없음"
            
            let mainVC = CustomChannelListViewController()
            mainVC.leftBarButton = nil
            
            mainVC.navigationItem.setHidesBackButton(true, animated: false)
            self.navigationController?.pushViewController(mainVC, animated: false)
        }
    }
}

class CustomChannelListViewController: SBUChannelListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func showChannel(channelUrl: String) {
        let params = SBDMessageListParams()
        params.includeMetaArray = true
        params.includeReactions = true
        params.includeReplies = true
        let channelVC = SBUChannelViewController(
            channelUrl: channelUrl,
            messageListParams: params
        )
        channelVC.hidesBottomBarWhenPushed = true
                
        self.navigationController?.pushViewController(channelVC, animated: true)
    }
    
    override func showCreateChannelTypeSelector() {
        self.showCreateChannel(type: .group)
    }
}
