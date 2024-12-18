# Add TensorFlow Lite rules
-keep class org.tensorflow.** { *; }
-dontwarn org.tensorflow.**

# Keep any generated classes
-keep class **.R
-keep class **.R$* { *; }

# Prevent issues with reflection
-keepattributes *Annotation*
-keepattributes EnclosingMethod
