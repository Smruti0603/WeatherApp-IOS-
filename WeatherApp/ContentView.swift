//
//  ContentView.swift
//  WeatherApp
//
//  Created by smruti on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? Color.black : Color.blue ,bottomColor: isNight ? .gray : Color("LightBlue"))
            
            VStack{
                CityNameView(cityName: "Mumbai, India")
//                    .background(.red)
//                    .frame(width: 200, height: 200)
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 21, isNight: isNight)
               
                
                
                HStack(spacing: 20){
                    WeatherdayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperate: 23)
                    WeatherdayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperate: 20)
                    WeatherdayView(dayOfWeek: "THU", imageName: "wind", temperate: 21)
                    WeatherdayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperate: 20)
                    WeatherdayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperate: 19)
                    
                    
                    
                }
                Spacer()
                
                Button{
                    withAnimation {
                        isNight.toggle()
                    }
                    
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    
                }
                                
                Spacer()
                
                    
            }
            
            
        }

    }
}

#Preview {
    ContentView()
}

struct WeatherdayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperate: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperate)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint:.topLeading,
            endPoint:.bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temp: Int
    var isNight: Bool
    
    var body: some View {
        
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .symbolEffect(isNight ? .breathe : .breathe, value: isNight)
            

            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            
        }
        .padding(.bottom, 40)
        
    }
    
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
       
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
     
        
    }
}
