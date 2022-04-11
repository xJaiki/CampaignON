//
//  character.swift
//  progettoFinale
//
//  Created by Mario Di Marino on 01/02/21.
//

import Foundation
import SwiftUI
import Combine
class SheetContainer: ObservableObject {
    @Published var sheets = [Sheet]()
    func add(object: Sheet){
        self.sheets.append(object)
    }
}


struct characterView: View{
    @ObservedObject var characters = SheetContainer()
    
    let nearbyService = NearbyService(serviceType: "characters")
    
    @State var counter = 1
    @State var count = 0
   @State var isButtonDis = false
   @State var showAlert = false
    @State var sheetContainer = [Sheet2]()
  @State  var sheetrepr = Sheet2()
@State var sheet = Sheet()
   // @State var text = "bio"
    @State var haveImage = false
    @State var canPlay = false
    @State var isShowEdit = false
    @State public var isShowPhotoLibrary = false
    @State public var isShowCamera = false
    @State private var image1 = UIImage(named: "avatar")
    var body: some View {
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        return NavigationView{
            ZStack {
                    Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                
            List{
                ForEach(characters.sheets,id: \.id){ char in
                  
                HStack{
                    NavigationLink(destination: SheetDetailView(image: char.avatar,name: char.name,race: char.race,Class: char.Class, hp: char.hp, ac: char.ac, sp: char.sp, In: char.In, pp: char.pp, cr: char.cr)){
                        Image(uiImage: char.avatar)
                        .resizable()
                        .frame(width: 80,height: 80)
                            VStack{
                                HStack{
                                    Text("Name: ")
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, design: .default))
                                    Text(char.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                }
                                HStack{
                                    Text("Race: ")
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, design: .default))
                                    Text(char.race)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                }
                                HStack{
                                    Text("Class: ")
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, design: .default))
                                    Text(char.Class)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                }
                            }
                        }
                    
                    
                }
                                         
                }.onDelete{ (indexSet) in
                    self.characters.sheets.remove(atOffsets: indexSet)
                    isButtonDis = false
                    
                    count-=1
                    counter-=1
                    sheetContainer.remove(atOffsets : indexSet)
                    print(counter)
                    
                }
                .listRowBackground(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                
            }
                //                MARK: add character
                .navigationBarItems(trailing:
                                        NavigationLink("Add Character", destination:
                                                        ZStack {
                                                                Image("background")
                                                                    .resizable()
                                                                    .edgesIgnoringSafeArea(.all)
                                                        VStack  {
                                                            HStack {
                                                                //                                MARK: avatar e bottone
                                                                VStack (){
                                                                    MyImageView(image1: $image1)
                                                                    Button(action: {
                                                                        self.isShowEdit = true
                                                                    }) {
                                                                        Text("edit")
                                                                            .frame(width: 50, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                            .padding()
                                                                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                            .cornerRadius(10)
                                                                            .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                            .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    }
                                                                    .sheet(isPresented: $isShowPhotoLibrary){
                                                                        ImagePicker(selectedImage: Binding($image1)!, sourceType: .photoLibrary)
                                                                            .onDisappear{
                                                                                let im = image1
                                                                                sheet.avatar = im!
                                                                                haveImage = true
                                                                            }
                                                                    }
                                                                }
                                                                
                                                                
                                                                Spacer()
                                                                
                                                                //                                MARK: informazioni nome
                                                                VStack (){
                                                                    TextField("Name", text: $sheet.name )
                                                                        .onChange(of: sheet.name, perform: { value in
                                                                            print("\(sheet.name)")
                                                                        })
                                                                        .frame(width: 150, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(40)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    Spacer()
                                                                    
                                                                    TextField("Race", text: $sheet.race)
                                                                        .frame(width: 150, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(40)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    Spacer()
                                                                    
                                                                    TextField("Class", text: $sheet.Class )
                                                                        .frame(width: 150, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(40)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                }
                                                                .frame(height: 140)
                                                            }
                                                            .padding(40)
                                                            Spacer()
                                                                .onDisappear {
                                                                    self.isShowEdit = false
                                                                }
                                                            
                                                            //                            MARK: box informazioni
                                                            VStack {
                                                                HStack (spacing: 30){
                                                                    //                                    health point
                                                                    TextField("HP", text: $sheet.hp)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    //                                    armor class
                                                                    TextField("AC", text: $sheet.ac)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                }
                                                                
                                                                Spacer()
                                                                
                                                                //                                speed
                                                                HStack (spacing: 30){
                                                                    TextField("SP", text: $sheet.sp)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    //                                    initiative
                                                                    TextField("IN", text: $sheet.In)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                }
                                                                
                                                                Spacer()
                                                                
                                                                HStack (spacing: 30){
                                                                    
                                                                    //                                    passive perception
                                                                    TextField("PP", text: $sheet.pp)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                    //                                    class resource
                                                                    TextField("CR", text: $sheet.cr)
                                                                        .keyboardType(.numberPad)
                                                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                        .padding()
                                                                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                        .cornerRadius(10)
                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                        .font(.system(size: 18, weight: .heavy, design: .default))
                                                                }
                                                                Spacer()
                                                                
                                                            }
                                                            Button(action: {
                                                                self.addRow()
                                                                print(counter)
                                                                
                                                            }) {
                                                                Text("Create")
                                                                    .frame(width: 200, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                    .padding()
                                                                    .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                                                    .cornerRadius(10)
                                                                    .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                                                    .font(.system(size: 18, weight: .heavy, design: .default))

                                                            }
                                                            .padding(.bottom, 10)
//                                                            .alert(isPresented: $showAlert) {
//                                                                Alert(title: Text("ERROR"), message: Text("Only 4 players allowed"), dismissButton: .default(Text("Got It")))
//                                                            }
                                                            Spacer()
                                                        }
                                                        
                                                    }
                                                        .onTapGesture {
                                                            hideKeyboard()
                                                        }
//                                                        .navigationBarTitle("Add characters")
                                        )
                ).navigationBarTitle("Characters")
                
            
                 
            
//            HStack {
//                VStack {
//                    Text("prova")
//                }
//            }
                Button(action: {
                    if count == 4{
                    nearbyService.send(obj: sheetContainer[0], type: DataType.sheet.rawValue)
                    nearbyService.send(obj: sheetContainer[1], type: DataType.sheet.rawValue)
                    nearbyService.send(obj: sheetContainer[2], type: DataType.sheet.rawValue)
                        nearbyService.send(obj: sheetContainer[3], type: DataType.sheet.rawValue)}else{
                            canPlay = true
                        }
                }) {
                    Text("Start Game")
                        .frame(width: 200, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        .cornerRadius(15)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 18, weight: .heavy, design: .default))
                }
                .padding(.top, 380)
            } .alert(isPresented: $canPlay) {
                Alert(title: Text("ERROR"), message: Text("Add 4 character"), dismissButton: .default(Text("Got It")))
            }
//            .ignoresSafeArea(.keyboard, edges: .bottom)
        }.onAppear{
            self.nearbyService.nearbyServiceDelgate = self
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("ERROR"), message: Text("Only 4 players allowed"), dismissButton: .default(Text("Got It")))
        }
        .sheet(isPresented: $isShowCamera){
            ImagePicker(selectedImage: Binding($image1)!, sourceType: .camera)
                .onDisappear{
                    let im = image1
                    sheet.avatar = im!
                    haveImage = true
                }
            
            
        }
       
        .actionSheet(isPresented: $isShowEdit, content: {
            ActionSheet(title: Text("Change avatar"), message: Text("Choose From"), buttons: [
                            .default(Text("Gallery"), action: {
                                self.isShowPhotoLibrary = true
                                self.isShowEdit = false
                                
                            }),.default(Text("Camera"),action: {
                                self.isShowCamera = true
                                self.isShowEdit = false
                            }),.cancel()])
            
        })
        
    }


    private func addRow(){
        if haveImage == false {
            sheet.avatar = UIImage(named: "avatar")!
        }
      
        if count == 4{
            isButtonDis = true
            showAlert = true
           // characters.sheets.removeLast()
            
        }else{
        
        self.characters.add(object: sheet)
        
        self.setData()
        sheet.id = UUID()
        sheet.name = ""
        sheet.race = ""
        sheet.Class = ""
        sheet.hp = ""
        sheet.In = ""
        sheet.ac = ""
        sheet.pp = ""
        sheet.sp = ""
        sheet.cr = ""
        image1 = UIImage(named: "avatar")
            count+=1
        }
        
    }
    private func setData(){
        sheetrepr.name = sheet.name
        sheetrepr.race = sheet.race
        sheetrepr.Class = sheet.Class
        sheetrepr.hp = sheet.hp
        sheetrepr.In = sheet.In
        sheetrepr.ac = sheet.ac
        sheetrepr.cr = sheet.cr
        sheetrepr.pp = sheet.pp
        sheetrepr.sp = sheet.sp
        sheetrepr.slot = counter
        if haveImage == true {
            
            let immag = sheet.avatar.compress(to: 300)
            sheetrepr.image = immag
            haveImage = false
        }else {
            if let im = UIImage(named: "avatar") {
            
                sheetrepr.image = im.jpegData(compressionQuality: 0.1)!
            
            }
        }
        counter+=1
        sheetContainer.append(sheetrepr)
        
//        nearbyService.send(obj: sheetrepr, type: DataType.sheet.rawValue)
    }
    
}



struct MyImageView: View {
    @Binding var image1: UIImage?
    var body: some View {
        Image(uiImage: image1!)
            .resizable()
            .frame(width: 110, height: 110, alignment: .center)
            .cornerRadius(10)
        
        
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension characterView: NearbyServiceDelegate{
    func multiPeer(didReceiveData data: Data, ofType type: UInt32, from peerID: MCPeerID) {
        switch type {
            case DataType.string.rawValue:
              let string = data.convert() as! String
              // do something with the received string
              break
                      
            case DataType.image.rawValue:
              let image = UIImage(data: data)
              print("image sent")
               
                break
                      
            default:
              break
          }
    }
    
    
    
    
}
extension UIImage {
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    func compress(to kb: Int, allowedMargin: CGFloat = 0.2) -> Data {
        guard kb > 10 else { return Data() } // Prevents user from compressing below a limit (10kb in this case).
        let bytes = kb * 1024
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        var complete = false
        while(!complete) {
            guard let data = holderImage.jpegData(compressionQuality: 1.0) else { break }
            let ratio = data.count / bytes
            if data.count < Int(CGFloat(bytes) * (1 + allowedMargin)) {
                complete = true
                return data
            } else {
                let multiplier:CGFloat = CGFloat((ratio / 5) + 1)
                compression -= (step * multiplier)
            }
            guard let newImage = holderImage.resized(withPercentage: compression) else { break }
            holderImage = newImage
        }
        
        return Data()
    }
}
