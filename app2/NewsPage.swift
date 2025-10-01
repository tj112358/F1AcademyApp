//
//  NewsPage.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI
import WebKit

struct headline2: View {
    var headline: String
    var title: String
    var img: String
    var address: String
    
    var body: some View {
        NavigationLink(destination: WebView(url: URL(string: address))) {
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 80)
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15)))
                    VStack(alignment: .leading){
                        Text(title .uppercased())
                            .foregroundColor(Color(snow))
                            .font(.system(size: 14))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(Color(snow))
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(10)
                }
            }
            .background(Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(15)
                .foregroundColor(Color(olive))
                //.shadow(radius: 15)
            )
            .padding(.top, 5)
            .padding(.horizontal)
        }
    }
}

struct Headliner: View {
    var headline: String
    var title: String
    var img: String
    
    var body: some View{
        ZStack{
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Text(title)
                        .foregroundColor(Color(jet))
                        .font(.custom("ProximaNova-Medium", size: 15))
                    Text(headline)
                        .font(.custom("Formula1-Display-Bold", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color(jet))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0.55)))
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 15, bottomTrailing: 15)))
                )
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.top, 5)
        .padding(.horizontal)
        
    }
}

struct NewsPage: View {
    var body: some View {
        NavigationView {
            let JSON = """
        [
            {
              "title": "Billard ‘always pushing’ as she reflects on promising pace in F1 ACADEMY Rookie Test",
              "id": "https://www.f1academy.com/Latest/4zJnPIz5DMbCu8lufqt3gB/billard-always-pushing-as-she-reflects-on-promising-pace-in-f1-academy",
              "url": "https://www.f1academy.com/Latest/4zJnPIz5DMbCu8lufqt3gB/billard-always-pushing-as-she-reflects-on-promising-pace-in-f1-academy",
              "content_html": "Interview",
              "date_published": "2025-09-23T14:12:40"
            },
            {
              "title": "Career Spotlight: Meet Alicia Schinko, On-Site Social Media Manager at the Champions of the Future Academy Program",
              "id": "https://www.f1academy.com/Latest/6rXYqZ6EirkBzlWReOZ1oN/career-spotlight-meet-alicia-schinko-on-site-social-media-manager-at-the",
              "url": "https://www.f1academy.com/Latest/6rXYqZ6EirkBzlWReOZ1oN/career-spotlight-meet-alicia-schinko-on-site-social-media-manager-at-the",
              "content_html": "Feature",
              "date_published": "2025-09-23T15:17:21.028531"
            },
            {
              "title": "Stevens delighted to make a big step forward after topping F1 ACADEMY Rookie Test",
              "id": "https://www.f1academy.com/Latest/2rflPH4tloMfXy5IFYfAKn/stevens-delighted-to-make-a-big-step-forward-after-topping-f1-academy-rookie",
              "url": "https://www.f1academy.com/Latest/2rflPH4tloMfXy5IFYfAKn/stevens-delighted-to-make-a-big-step-forward-after-topping-f1-academy-rookie",
              "content_html": "Interview",
              "date_published": "2025-09-23T11:10:08"
            },
            {
              "title": "Stevens fastest in landmark F1 ACADEMY Rookie Test",
              "id": "https://www.f1academy.com/Latest/1AdpZ4uMdg2FmnMl8U706m/stevens-fastest-in-landmark-f1-academy-rookie-test",
              "url": "https://www.f1academy.com/Latest/1AdpZ4uMdg2FmnMl8U706m/stevens-fastest-in-landmark-f1-academy-rookie-test",
              
              "date_published": "2025-09-18T18:57:35"
            },
            {
              "title": "Felbermayr striving for more silverware after ‘productive’ Navarra test",
              "id": "https://www.f1academy.com/Latest/3mcoCPVdDSlTs3IWQ3yan9/felbermayr-striving-for-more-silverware-after-productive-navarra-test",
              "url": "https://www.f1academy.com/Latest/3mcoCPVdDSlTs3IWQ3yan9/felbermayr-striving-for-more-silverware-after-productive-navarra-test",
              "content_html": "Interview",
              "date_published": "2025-09-18T12:54:33"
            },
            {
              "title": "Lloyd sweeps Day 2 to end Navarra in-season testing on top ",
              "id": "https://www.f1academy.com/Latest/1dhtKPlH39vTjtmDkXl7QQ/lloyd-sweeps-day-2-to-end-navarra-in-season-testing-on-top",
              "url": "https://www.f1academy.com/Latest/1dhtKPlH39vTjtmDkXl7QQ/lloyd-sweeps-day-2-to-end-navarra-in-season-testing-on-top",
              "content_html": "Report",
              "date_published": "2025-09-17T14:51:04"
            },
            {
              "title": "F1 ACADEMY Rookie Test Explained",
              "id": "https://www.f1academy.com/Latest/4oQhYtDdPPgJtCpWzmUbxz/f1-academy-rookie-test-explained",
              "url": "https://www.f1academy.com/Latest/4oQhYtDdPPgJtCpWzmUbxz/f1-academy-rookie-test-explained",
              "content_html": "Feature",
              "date_published": "2025-09-17T14:36:04"
            },
            {
              "title": "Weug aiming to keep up the pace in Singapore after sweeping Day 1 of Navarra testing",
              "id": "https://www.f1academy.com/Latest/7qmgtsTICjQpKMbLlAXxtv/weug-aiming-to-keep-up-the-pace-in-singapore-after-sweeping-day-1-of-navarra",
              "url": "https://www.f1academy.com/Latest/7qmgtsTICjQpKMbLlAXxtv/weug-aiming-to-keep-up-the-pace-in-singapore-after-sweeping-day-1-of-navarra",
              "content_html": "Interview",
              "date_published": "2025-09-17T14:21:04"
            },
            {
              "title": "Weug quickest on opening day of Navarra in-season testing",
              "id": "https://www.f1academy.com/Latest/3YiRJRnuRp9A50CXiXO90B/weug-quickest-on-opening-day-of-navarra-in-season-testing",
              "url": "https://www.f1academy.com/Latest/3YiRJRnuRp9A50CXiXO90B/weug-quickest-on-opening-day-of-navarra-in-season-testing",
              "content_html": "Report",
              "date_published": "2025-09-17T14:06:04"
            },
            {
              "title": "PREVIEW: F1 ACADEMY returns with in-season and rookie testing in Navarra",
              "id": "https://www.f1academy.com/Latest/4y9226MB1QJIezsHS9pwIG/preview-f1-academy-returns-with-in-season-and-rookie-testing-in-navarra",
              "url": "https://www.f1academy.com/Latest/4y9226MB1QJIezsHS9pwIG/preview-f1-academy-returns-with-in-season-and-rookie-testing-in-navarra",
              "content_html": "Preview",
              "date_published": "2025-09-17T13:51:04"
            },
            {
              "title": "Landmark F1 ACADEMY rookie test set to drive forward series’ future talent pipeline",
              "id": "https://www.f1academy.com/Latest/2QvwiQX1Pb2Itbt4abZhgD/landmark-f1-academy-rookie-test-set-to-drive-forward-series-future-talent",
              "url": "https://www.f1academy.com/Latest/2QvwiQX1Pb2Itbt4abZhgD/landmark-f1-academy-rookie-test-set-to-drive-forward-series-future-talent",
        
              "date_published": "2025-09-17T15:41:44"
            },
            {
              "title": "‘A small mistake with a big cost’ – Hausmann relieved to compensate for lost podium with Race 2 points",
              "id": "https://www.f1academy.com/Latest/6DbTZhoEAaaYehYoVFuZM0/a-small-mistake-with-a-big-cost-hausmann-relieved-to-compensate-for-lost",
              "url": "https://www.f1academy.com/Latest/6DbTZhoEAaaYehYoVFuZM0/a-small-mistake-with-a-big-cost-hausmann-relieved-to-compensate-for-lost",
              "content_html": "Interview",
              "date_published": "2025-09-17T13:21:04"
            },
            {
              "title": "Get your F1 ACADEMY caps now!",
              "id": "https://www.f1academy.com/Latest/1riy8ZgSZ4bkgRtuSXR03G/get-your-f1-academy-caps-now",
              "url": "https://www.f1academy.com/Latest/1riy8ZgSZ4bkgRtuSXR03G/get-your-f1-academy-caps-now",
              "content_html": "News",
              "date_published": "2025-09-17T13:06:04"
            },
            {
              "title": "Hodder hails Kosterman’s ‘mature drive’ for showing Hitech TGR’s true pace",
              "id": "https://www.f1academy.com/Latest/NXWktb5J0JZrfTXsTl0XS/hodder-hails-kostermans-mature-drive-for-showing-hitech-tgrs-true-pace",
              "url": "https://www.f1academy.com/Latest/NXWktb5J0JZrfTXsTl0XS/hodder-hails-kostermans-mature-drive-for-showing-hitech-tgrs-true-pace",
              "content_html": "Interview",
              "date_published": "2025-09-17T12:51:04"
            },
            {
              "title": "Chambers set on ‘taking more risks’ after Zandvoort DNS spelt title misfortune",
              "id": "https://www.f1academy.com/Latest/360YE4wH0tWQ1297weUsKk/chambers-set-on-taking-more-risks-after-zandvoort-dns-spelt-title-misfortune",
              "url": "https://www.f1academy.com/Latest/360YE4wH0tWQ1297weUsKk/chambers-set-on-taking-more-risks-after-zandvoort-dns-spelt-title-misfortune",
              "content_html": "Interview",
              "date_published": "2025-09-17T12:36:04"
            },
            {
              "title": "‘Maya did everything she needed to do’ – Blokhuis insists title fight is back on if Weug can recreate Zandvoort triumph in Singapore",
              "id": "https://www.f1academy.com/Latest/4FVRv1PwZcjgdH9kEsSx0V/maya-did-everything-she-needed-to-do-blokhuis-insists-title-fight-is-back-on",
              "url": "https://www.f1academy.com/Latest/4FVRv1PwZcjgdH9kEsSx0V/maya-did-everything-she-needed-to-do-blokhuis-insists-title-fight-is-back-on",
              "content_html": "Interview",
              "date_published": "2025-09-17T12:21:04"
            },
            {
              "title": "‘The best weekend that I’ve had in my whole life!’ — Wild Card Kosterman thrilled with points finish in Zandvoort",
              "id": "https://www.f1academy.com/Latest/6XZer9SKDBQIED0XNOml1c/the-best-weekend-that-ive-had-in-my-whole-life-wild-card-kosterman-thrilled",
              "url": "https://www.f1academy.com/Latest/6XZer9SKDBQIED0XNOml1c/the-best-weekend-that-ive-had-in-my-whole-life-wild-card-kosterman-thrilled",
              "content_html": "Interview",
              "date_published": "2025-09-17T12:06:04"
            },
            {
              "title": "Pirro concedes ‘you always want more’ despite positive weekend in Zandvoort for PREMA",
              "id": "https://www.f1academy.com/Latest/5RVfxiKRiYAsNWWqa3bSL0/pirro-concedes-you-always-want-more-despite-positive-weekend-in-zandvoort",
              "url": "https://www.f1academy.com/Latest/5RVfxiKRiYAsNWWqa3bSL0/pirro-concedes-you-always-want-more-despite-positive-weekend-in-zandvoort",
              "content_html": "Interview",
              "date_published": "2025-09-17T11:51:04"
            },
            {
              "title": "STANDOUT STARS: Who banked on Zandvoort success in Round 5?",
              "id": "https://www.f1academy.com/Latest/73M2C1uOGf7gJibK79FGsT/standout-stars-who-banked-on-zandvoort-success-in-round-5",
              "url": "https://www.f1academy.com/Latest/73M2C1uOGf7gJibK79FGsT/standout-stars-who-banked-on-zandvoort-success-in-round-5",
              "content_html": "Feature",
              "date_published": "2025-09-17T11:36:04"
            },
            {
              "title": "Pin ‘proud of the mindset’ that she had after tough Zandvoort weekend sees Standings lead slashed",
              "id": "https://www.f1academy.com/Latest/1cRscAdHLLITkOYyiPjYmm/pin-proud-of-the-mindset-that-she-had-after-tough-zandvoort-weekend-sees",
              "url": "https://www.f1academy.com/Latest/1cRscAdHLLITkOYyiPjYmm/pin-proud-of-the-mindset-that-she-had-after-tough-zandvoort-weekend-sees",
              "content_html": "Interview",
              "date_published": "2025-09-17T11:21:04"
            },
            {
              "title": "Palmowski credits tireless overnight work for a ‘big step forward’ with Zandvoort podium",
              "id": "https://www.f1academy.com/Latest/7g6YgNN4PoDG6IwfN9P0nc/palmowski-credits-tireless-overnight-work-for-a-big-step-forward-with",
              "url": "https://www.f1academy.com/Latest/7g6YgNN4PoDG6IwfN9P0nc/palmowski-credits-tireless-overnight-work-for-a-big-step-forward-with",
              "content_html": "Interview",
              "date_published": "2025-09-17T11:06:04"
            }
          ]
        """
            
            let jsonData = JSON.data(using: .utf8)!
            let blogPost: [BlogPost] = try! JSONDecoder().decode([BlogPost].self, from: jsonData)
            
            ZStack{
                Color(jet) //i am the background
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{ //i am the top bar w race countdown
                        VStack{
                            Text("Jeddah")
                                .font(.custom("Formula1-Display-Regular", size: 30))
                            Text("SEP 19-20")
                                .font(.custom("Formula1-Display-Regular", size: 12))
                        }
                        .frame(alignment: .leading)
                        Spacer()
                        Text("00:00:00")
                            .font(.custom("Formula1-Display-Regular", size: 24))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(jet))
                    //.background(Color(olive))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(blue), Color(purple), Color(pink)]), startPoint: .leading, endPoint: .trailing)
                    )
                    //Here is the main part of the view
                    ScrollView {
                        VStack{ //i am the main news scroll page
                            Headliner (headline: "skibidi sad", title: "SPECIAL EDITION", img: "arch")
                            //headline2 ()
                            ForEach(blogPost, id: \.title) { blogPost in
                                headline2 (headline: "\(blogPost.title)", title: "\(blogPost.content_html ?? "F1 NEWS")", img: "arch", address: "\(blogPost.url)")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct BlogPost: Decodable {
    let title: String
    let url: URL
    let content_html: String?
}
#Preview {
    ContentView()
}
