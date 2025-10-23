plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.alarmnoti"
    compileSdk = flutter.compileSdkVersion

    defaultConfig {
        applicationId = "com.example.alarmnoti"
        minSdk = 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "11"
    }

  buildTypes {
    getByName("release") {
        signingConfig = signingConfigs.getByName("debug")
        isMinifyEnabled = false        // code shrinking OFF
        isShrinkResources = false      // resource shrinking OFF
    }
}
}

dependencies {
    // Core library desugaring for Java 8+ APIs
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")

    // Kotlin standard library for Java 11
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.9.10")
}

flutter {
    source = "../.."
}
