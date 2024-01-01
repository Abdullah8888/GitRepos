//
//  OnboardingModel.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

struct OnboardingModel {
    var data: [OnbordingData] {
        let data1 = OnbordingData(image: "onboarding_slide_one", header: "Welcome to CheckIT", subHeader: "Seamlessly Explore, Collaborate, and Elevate Your Projects")
        let data2 = OnbordingData(image: "onboarding_slide_two", header: "Exploring Possibilities", subHeader: "Navigate, Collaborate, and Create with CheckIT")
        let data3 = OnbordingData(image: "onboarding_slide_three", header: "Enhance Your GitHub Journey", subHeader: "Effortless Innovation and Collaboration Awaits with CheckIT")
        return [data1,data2,data3]
    }
}

struct OnbordingData {
    var image: String
    var header: String
    var subHeader: String
}
