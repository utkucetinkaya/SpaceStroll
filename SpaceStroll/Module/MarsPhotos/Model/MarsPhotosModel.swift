//
//  MarsPotosModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 6.07.2023.
//

import Foundation

// MARK: - MarsPhotos
struct MarsPhotos: Codable {
    let latestPhotos: [LatestPhoto]

    enum CodingKeys: String, CodingKey {
        case latestPhotos = "latest_photos"
    }
}

// MARK: - LatestPhoto
struct LatestPhoto: Codable {
    let id, sol: Int?
    let camera: LatestPhotoCamera?
    let imgSrc: String?
    let earthDate: String?
    let rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - LatestPhotoCamera
struct LatestPhotoCamera: Codable {
    let id: Int?
    let name: CameraName?
    let roverID: Int?
    let fullName: FullName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

enum FullName: String, Codable {
    case descentStageDownLookCamera = "Descent Stage Down-Look Camera"
    case frontHazardAvoidanceCameraLeft = "Front Hazard Avoidance Camera - Left"
    case frontHazardAvoidanceCameraRight = "Front Hazard Avoidance Camera - Right"
    case landerVisionSystemCamera = "Lander Vision System Camera"
    case mastCameraZoomLeft = "Mast Camera Zoom - Left"
    case mastCameraZoomRight = "Mast Camera Zoom - Right"
    case medaSkycam = "MEDA Skycam"
    case navigationCameraLeft = "Navigation Camera - Left"
    case navigationCameraRight = "Navigation Camera - Right"
    case parachuteUpLookCameraA = "Parachute Up-Look Camera A"
    case parachuteUpLookCameraB = "Parachute Up-Look Camera B"
    case rearHazardAvoidanceCameraLeft = "Rear Hazard Avoidance Camera - Left"
    case rearHazardAvoidanceCameraRight = "Rear Hazard Avoidance Camera - Right"
    case roverDownLookCamera = "Rover Down-Look Camera"
    case roverUpLookCamera = "Rover Up-Look Camera"
    case sherlocWATSONCamera = "SHERLOC WATSON Camera"
    case superCamRemoteMicroImager = "SuperCam Remote Micro Imager"
}

enum CameraName: String, Codable {
    case edlDdcam = "EDL_DDCAM"
    case edlPucam1 = "EDL_PUCAM1"
    case edlPucam2 = "EDL_PUCAM2"
    case edlRdcam = "EDL_RDCAM"
    case edlRucam = "EDL_RUCAM"
    case frontHazcamLeftA = "FRONT_HAZCAM_LEFT_A"
    case frontHazcamRightA = "FRONT_HAZCAM_RIGHT_A"
    case lcam = "LCAM"
    case mczLeft = "MCZ_LEFT"
    case mczRight = "MCZ_RIGHT"
    case navcamLeft = "NAVCAM_LEFT"
    case navcamRight = "NAVCAM_RIGHT"
    case rearHazcamLeft = "REAR_HAZCAM_LEFT"
    case rearHazcamRight = "REAR_HAZCAM_RIGHT"
    case sherlocWatson = "SHERLOC_WATSON"
    case skycam = "SKYCAM"
    case supercamRMI = "SUPERCAM_RMI"
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int?
    let name: RoverName?
    let landingDate, launchDate: String?
    let status: Status?
    let maxSol: Int?
    let maxDate: String?
    let totalPhotos: Int?
    let cameras: [CameraElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

// MARK: - CameraElement
struct CameraElement: Codable {
    let name: CameraName?
    let fullName: FullName?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

enum RoverName: String, Codable {
    case perseverance = "Perseverance"
}

enum Status: String, Codable {
    case active = "active"
}
