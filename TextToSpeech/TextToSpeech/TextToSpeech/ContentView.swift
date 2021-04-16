//
//  ContentView.swift
//  TextToSpeech
//
//  Created by Ranim Alayoubi on 30/03/2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var text = "My name is Ranim. I managed to implement text to speech in one day. I love IOS"


    var body: some View {
        VStack(spacing:50) {
            Button(action: {
                let utterance = AVSpeechUtterance(string: self.text)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)

            }) {
            Text("Speak out")
            }

            TextArea(
            text: $text
            ).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .font(.system(size:18))
    }}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextArea: UIViewRepresentable {
@Binding var text: String

    func makeUIView(context: Context) -> UITextView {

        let myTextArea = UITextView()
        myTextArea.delegate = context.coordinator
        myTextArea.font = UIFont(name: "HelveticaNeue", size: 55)
        myTextArea.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.8, blue: 1.0, alpha: 0.2)

        return myTextArea
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextArea

        init(_ uiTextView: TextArea) {
            self.parent = uiTextView
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
