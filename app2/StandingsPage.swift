//
//  Standings.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI

struct Driver: Identifiable {
    let id = UUID()
    let name: String
    let position: String
    let points: String
    let headshot: String
    let firstName: String
    let lastName: String
    let number: String
    let nation: String
    //let profile: String
}


struct StandingsPage: View {
    
    private let drivers = [
        Driver(name: "D. Pin", position: "1", points: "127", headshot: "pin_headshot", firstName: "Doriane", lastName: "Pin", number: "28", nation: "🇫🇷"),
        Driver(name: "M. Weug", position: "2", points: "107", headshot: "weug_headshot", firstName: "Maya", lastName: "Weug", number: "64", nation: "🇳🇱"),
        Driver(name: "C. Chambers", position: "3", points: "93", headshot: "chambers_headshot", firstName: "Chloe", lastName: "Chambers", number: "14", nation: "🇺🇸"),
        Driver(name: "E. Lloyd", position: "4", points: "84", headshot: "lloyd_headshot", firstName: "Ella", lastName: "Lloyd", number: "20", nation: "🇬🇧"),
        Driver(name: "A. Palmowski", position: "5", points: "73", headshot: "palmowski_headshot", firstName: "Alisha", lastName: "Palmowski", number: "21", nation: "🇬🇧"),
        Driver(name: "N. Gademan", position: "6", points: "51", headshot: "gademan_headshot", firstName: "Nina", lastName: "Gademan", number: "3", nation: "🇳🇱"),
        Driver(name: "A. Larsen", position: "7", points: "48", headshot: "larsen_headshot", firstName: "Alba", lastName: "Larsen", number: "12", nation: "🇩🇰"),
        Driver(name: "T. Hausmann", position: "8", points: "46", headshot: "hausmann_headshot", firstName: "Tina", lastName: "Hausmann", number: "78", nation: "🇨🇭"),
        Driver(name: "L. Block", position: "9", points: "23", headshot: "block_headshot", firstName: "Lia", lastName: "Block", number: "57", nation: "🇺🇸"),
        Driver(name: "E. Felbermayr", position: "10", points: "22", headshot: "felbermayr_headshot", firstName: "Emma", lastName: "Felbermayr", number: "5", nation: "🇦🇹"),
        Driver(name: "R. Ferreira", position: "11", points: "13", headshot: "ferreira_headshot", firstName: "Rafaela", lastName: "Ferreira", number: "18", nation: "🇧🇷"),
        Driver(name: "C. Chong", position: "12", points: "12", headshot: "chong_headshot", firstName: "Chloe", lastName: "Chong", number: "27", nation: "🇬🇧"),
        Driver(name: "E. Kosterman (WCD)", position: "13", points: "6", headshot: "kosterman_headshot", firstName: "Esmee", lastName: "Kosterman", number: "86", nation: "🇳🇱"),
        Driver(name: "A. Nobels", position: "14", points: "5", headshot: "nobels_headshot", firstName: "Aurelia", lastName: "Nobels", number: "22", nation: "🇧🇷"),
        Driver(name: "A. Anagnostiadis", position: "15", points: "5", headshot: "anagnostiadis_headshot", firstName: "Aiva", lastName: "Anagnostiadis", number: "11", nation: "🇦🇺"),
        Driver(name: "J. Ciconte", position: "16", points: "4", headshot: "ciconte_headshot", firstName: "Joanne", lastName: "Ciconte", number: "25", nation: "🇦🇺"),
        Driver(name: "N. Havrda", position: "17", points: "1", headshot: "havrda_headshot", firstName: "Nicole", lastName: "Havrda", number: "2", nation: "🇨🇦"),
        Driver(name: "C. Crone", position: "18", points: "0", headshot: "crone_headshot", firstName: "Courtney", lastName: "Crone", number: "7", nation: "🇺🇸"),
        Driver(name: "M. Paatz (WCD)", position: "19", points: "0", headshot: "paatz_headshot", firstName: "Mathilda", lastName: "Paatz", number: "", nation: ""),
        Driver(name: "A. Dobson (WDC)", position: "20", points: "0", headshot: "dobson_headshot", firstName: "Ava", lastName: "Dobson", number: "", nation: ""),
        Driver(name: "W. Shi (WDC)", position: "21", points: "0", headshot: "shi_headshot", firstName: "Wei", lastName: "Shi", number: "", nation: ""),
        Driver(name: "F. AlYousef (WCD)", position: "22", points: "0", headshot: "alyousef_headshot", firstName: "Farah", lastName: "AlYousef", number: "", nation: "")
    ]
    
    var body: some View {
        NavigationView{
                ScrollView{
                    VStack{
                        Text("DRIVERS' STANDINGS")
                            .foregroundStyle(Color(snow))
                            .font(.custom("Formula1-Display-Regular", size: 26))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 30){
                            GridRow {
                                Text("POS")
                                Text("DRIVER")
                                    .gridCellColumns(2)
                                Text("PTS")
                            }
                            .font(.custom("ProximaNova-Bold", size: 20))
                            
                            ForEach(drivers, id: \.id) { driver in
                                GridRow{
                                    Text("\(driver.position)")
                                        .padding(.leading, 5)
                                        .padding(.trailing, 20)
                                        .font(.custom("Formula1-Display-Regular", size: 14))
                                    NavigationLink (destination: DriverView(driver: driver)){
                                        Image("\(driver.headshot)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .padding(.trailing, 15)
                                    }
                                    NavigationLink (destination: DriverView(driver: driver)){
                                        Text("\(driver.name)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.custom("Formula1-Display-Regular", size: 14))
                                    }
                                    Text("\(driver.points)")
                                        .font(.custom("Formula1-Display-Regular", size: 14))
                                }
                            }
                        }
                        .foregroundStyle(Color(snow))
                        .font(.custom("ProximaNova-Medium", size: 15))
                        .frame(maxWidth: .infinity)
                    }
                    .padding(20)
                }
            }
        }
    }


struct DriverView: View {
    
    let driver: Driver
    
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        ZStack{
                            GeometryReader {proxy in
                                Image("\(driver.lastName)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width, height: 275) //275
                            }
                            VStack{
                                Spacer()
                                VStack{
                                    Text("\(driver.firstName)")
                                        .foregroundColor(Color(jet))
                                        .font(.custom("Formula1-Display-Regular", size: 20))
                                    Text("\(driver.lastName)" .uppercased())
                                        .font(.custom("Formula1-Display-Regular", size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(jet))
                                        .frame(maxWidth: .infinity)
                                    HStack {
                                        Text("\(driver.nation)")
                                            .font(.custom("Formula1-Display-Regular", size: 40))
                                            .foregroundColor(Color(snow))
                                        Text("\(driver.number)")
                                            .font(.custom("Formula1-Display-Regular", size: 30))
                                            .foregroundColor(Color(jet))
                                    }
                                }
                                .padding(.top, 163)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0)), Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0.70))]), startPoint: .top, endPoint: .bottom)
                                )
                            }
                        }
                        HStack {
                            Text("Statistics")
                            Text("Biography")
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                            Text("Results")
                        }
                        .font(.custom("Formula1-Display-Regular", size: 16))
                        .foregroundColor(Color(snow))
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color(olive)
                        )
                        Statistics()
                    }
                    
                }
            }
        }
    }

struct Statistics: View {
    var body: some View {
        VStack {
            Text("2025 SEASON")
                .font(.custom("Formula1-Display-Bold", size: 20))
                .padding(10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Grid(alignment: .leading){
                GridRow {
                    Text("Season Position")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Season Points")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("Team")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Supported By")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("Prema Racing")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("Mercedes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                Divider()
                GridRow {
                    Text("Podiums")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Poles")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("R1 Wins")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("R2 Wins")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("Top 10s")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("DNFs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                Divider()
            }
            
            
            Text("CAREER STATS")
                .font(.custom("Formula1-Display-Bold", size: 20))
                .padding(10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Grid(alignment: .leading){
                GridRow {
                    Text("Career Points")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Highest Race Finish")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00 (x00)")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                        .padding(.trailing, 40)

                }
                GridRow {
                    Text("Podiums")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Poles")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("DNFs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Races Entered")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Seasons Entered")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Wildcard Entries")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
            }
        }
    }
}

#Preview {
    StandingsPage()
}
