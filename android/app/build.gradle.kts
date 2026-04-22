// android/app/build.gradle.kts
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") 
}

android {
    namespace = "com.example.joe"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
         jvmTarget = JavaVersion.VERSION_17.toString()  // CHANGÉ : Utilisez String au lieu de JavaVersion
    }

    defaultConfig {
        applicationId = "com.example.joe"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// IMPORTANT: En Kotlin DSL, utilisez des parenthèses et des guillemets
dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
    add("coreLibraryDesugaring", "com.android.tools:desugar_jdk_libs:2.1.4")
    // Ou si coreLibraryDesugaring est configuré comme une configuration :
    // "coreLibraryDesugaring"("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-firestore")
}
