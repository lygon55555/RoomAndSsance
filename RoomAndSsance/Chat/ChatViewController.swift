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
            SBUStringSet.ChannelSettings_Change_Name = "방 이름 바꾸기"
            SBUStringSet.ChannelSettings_Change_Image = "방 이미지 바꾸기"
            SBUStringSet.ChannelSettings_Header_Title = "방 정보"
            SBUStringSet.MemberList_Header_Title = "대화 상대"
            SBUStringSet.Cancel = "취소"
            SBUStringSet.InviteChannel_Header_Title = "대화 상대 초대"
            SBUStringSet.MessageInput_Text_Placeholder = "메시지 입력"
            SBUStringSet.MemberList_Header_Title = ""
            SBUStringSet.MemberList_Me = "(나)"
            SBUStringSet.Empty_No_Messages = "메시지 없음"
            
            let mainVC = TestChannelListViewController()
            mainVC.leftBarButton = nil
            mainVC.navigationItem.setHidesBackButton(true, animated: false)
            self.navigationController?.pushViewController(mainVC, animated: false)
        }
    }
}

class TestChannelListViewController: SBUChannelListViewController {
    
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
}
