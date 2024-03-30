//
//  ContentView.swift
//  Mobile app
//
//  Created by Анастасия Колодина on 30.03.2024.
//

import SwiftUI

// Enum для цветов
enum CustomColor {
    static let tabColor = Color(hex: "D9E6DB")
    static let buttonColor = Color(hex: "808080")
}

struct ContentView: View {
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Text("Профиль")
                            .foregroundColor(.white)
                            .padding()
                            .background(CustomColor.buttonColor)
                            .cornerRadius(10)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.top, 20)
                
                ZStack {
                    VStack {
                        Text("← март →")
                            .font(.custom("AtypText-Regular", size: 24))
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 40)
                        
                        HStack {
                            ForEach(daysOfWeek.indices, id: \.self) { index in
                                Text(daysOfWeek[index])
                                    .font(.custom("AtypText-Regular", size: 22))
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                        LazyVGrid(columns: columns) {
                            ForEach(Date.now.calendarDisplayDays, id: \.self) { day in
                                if day.monthInt != Date.now.monthInt {
                                    Text("")
                                } else {
                                    Text(day.formatted(.dateTime.day()))
                                        .font(.custom("AtypText-Regular", size: 24))
                                        .foregroundStyle(.secondary)
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .background(
                                            Circle()
                                                .foregroundStyle(
                                                    Date.now.startOfDay == day.startOfDay
                                                        ? .black.opacity(0.3)
                                                        : .white
                                                )
                                        )
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.top, -280)
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .background(.white)
                                .frame(height: 300)
                            Rectangle()
                                .fill(CustomColor.tabColor)
                                .frame(height: 300)
                            
                            Image("water")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 36, height: 36)
                                .padding(.top, -120)
                                .padding(.leading, -160)
                            
                            Text("Полив")
                                .padding(.top, -120)
                                .padding(.leading, -110)
                                .font(.custom("AtypText-Regular", size: 32))
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 340, height: 120)
                                .padding(.top, 20)
                                .cornerRadius(20)
                            
                            Image("plant") 
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 120)
                                .padding(.top, 20)
                                .padding(.leading, -164)
                            Text("Суккулент светлый Полина")
                                .padding(.top, -40)
                                .padding(.leading, 60)
                                .font(.custom("AtypText-Medium", size: 22))
                                .lineLimit(2)
                                .frame(width: 240)
                            Text("каждый день")
                                .padding(.top, 90)
                                .padding(.leading, 40)
                                .font(.custom("AtypText-Regular", size: 22))
                                .lineLimit(2)
                                .frame(width: 240)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Image("avatar")
            .frame(width: 60, height: 36)
            .padding(.top, -326)
            .padding(.leading, -170)
        Text("Polirybka")
            .padding(.top, -330)
            .padding(.leading, -100)
            .font(.custom("AtypText-Regular", size: 24))
        Text("Однажды забрала с работы фикус и теперь у меня 200 горшков ")
            .padding(.top, -280)
            .padding(.leading, -60)
            .font(.custom("AtypText-Regular", size: 20))
            .lineLimit(3)
            .frame(width: 240)
        Text("растения(10)          полки(10)")
            .padding(.top, -190)
            .padding(.leading, 0)
            .font(.custom("AtypText-Regular", size: 24))
        Image("flower1")
            .frame(width: 160, height: 36)
            .padding(.top, -50)
            .padding(.leading, -170)
        Image("flower2")
            .frame(width: 160, height: 36)
            .padding(.top, -60)
            .padding(.leading, 190)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}






