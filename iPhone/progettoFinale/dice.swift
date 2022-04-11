//
//  dice.swift
//  progettoFinale
//
//  Created by Mario Di Marino on 01/02/21.
//
//
import Foundation
import SwiftUI



class DiceContainer: ObservableObject {
    @Published var diceArray = [dice]()
    func add(object: dice){
        self.diceArray.append(object)
    }
}

struct dice {
    var id = UUID()
    var dice = Int()
}

struct diceView: View{
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(red: 47/255, green: 31/255, blue: 22/255, alpha: 1)]
    }
    let nearbyService = NearbyService(serviceType: "dice")
    @ObservedObject var diceContainer = DiceContainer()
    
    @State var canPlaySound = false
    
    @State var diceType = dice()
    
    @State var canClear = false
    
    @State var numD2 = 0
    @State var numD3 = 0
    @State var numD4 = 0
    @State var numD6 = 0
    @State var numD8 = 0
    @State var numD10 = 0
    @State var numD12 = 0
    @State var numD20 = 0
    @State var numD100 = 0
    @State var numDice: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State var lancid2: [Int] = []
    @State var lancid3: [Int] = []
    @State var lancid4: [Int] = []
    @State var lancid6: [Int] = []
    @State var lancid8: [Int] = []
    @State var lancid10: [Int] = []
    @State var lancid12: [Int] = []
    @State var lancid20: [Int] = []
    @State var lancid100: [Int] = []

    
    var body: some View {
        
        
        
        //        var diceArray: [Int] = []
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        return NavigationView{
            
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                //            MARK: Dice grill
                VStack{
                    
                    HStack{
                        Button(action: {
                            numDice[0] = numDice[0] + 1
                            diceType.dice = 2
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                        }) {
                            VStack {
                            Text("D2")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[0])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                        Button(action: {
                            numDice[2] = numDice[2] + 1
                            diceType.dice = 4
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [4]
                        }) {
                            VStack {
                            Text("D4")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[2])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                    }
                    HStack{
                        Button(action: {
                            numDice[3] = numDice[3] + 1
                            diceType.dice = 6
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [6]
                        }) {
                            VStack {
                            Text("D6")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[3])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                        Button(action: {
                            numDice[4] = numDice[4] + 1
                            diceType.dice = 8
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [8]
                        }) {
                            VStack {
                            Text("D8")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[4])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                        Button(action: {
                            numDice[5] = numDice[5] + 1
                            diceType.dice = 10
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [10]
                        }) {
                            VStack {
                            Text("D10")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[5])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                    }
                    HStack{
                        Button(action: {
                            numDice[6] = numDice[6] + 1
                            diceType.dice = 12
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [12]
                        }) {
                            VStack {
                            Text("D12")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[6])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                        Button(action: {
                            numDice[7] = numDice[7] + 1
                            diceType.dice = 20
                            diceContainer.diceArray.append(diceType)
                            diceType.id = UUID()
                            diceType.dice = 0
                            //                        diceArray += [20]
                        }) {
                            VStack {
                            Text("D20")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .padding(5)
                            Text("\(numDice[7])")
                                //                        .foregroundColor(.purple)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 12, weight: .light, design: .default))
                            }
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                            .cornerRadius(15)
                        }
                    }
                    
                    //                MARK: Dice informations
                    
                    Spacer()
                    
                    //                MARK: Clear buttons
                    HStack{
                        Button(action: {
                            
                            canPlaySound = true
                            nearbyService.send(object: canPlaySound, type: DataType.sound.rawValue)
                            
                            for i in 0...8 {
                                print("\(i+1) :\(numDice[i])")
                                if (numDice[i] > 0) {
                                    
                                    switch i {
                                    case 0:
                                        
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...2)
                                            lancid2.append(roll)
                                            print(lancid2[j])
                                            
                                            
                                        }
                                        nearbyService.send(object: lancid2, type: DataType.d2.rawValue)
                                        lancid2.removeAll()
                                        
                                        
                                    case 1:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...3)
                                            lancid3.append(roll)
                                            print(lancid3[j])
                                        }
                                    case 2:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...4)
                                            lancid4.append(roll)
                                            print(lancid4[j])
                                            
                                        }
                                        nearbyService.send(object: lancid4, type: DataType.d4.rawValue)
                                        lancid4.removeAll()
                                    case 3:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...6)
                                            lancid6.append(roll)
                                            print(lancid6[j])
                                            
                                        }
                                        nearbyService.send(object: lancid6, type: DataType.d6.rawValue)
                                        lancid6.removeAll()
                                    case 4:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...8)
                                            lancid8.append(roll)
                                            print(lancid8[j])
                                            
                                        }
                                        nearbyService.send(object: lancid8, type: DataType.d8.rawValue)
                                        lancid8.removeAll()
                                    case 5:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...10)
                                            lancid10.append(roll)
                                            print(lancid10[j])
                                            
                                        }
                                        nearbyService.send(object: lancid10, type: DataType.d10.rawValue)
                                        lancid10.removeAll()
                                    case 6:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...12)
                                            lancid12.append(roll)
                                            print(lancid12[j])
                                            
                                        }
                                        nearbyService.send(object: lancid12, type: DataType.d12.rawValue)
                                        lancid12.removeAll()
                                    case 7:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...20)
                                            lancid20.append(roll)
                                            print(lancid20[j])
                                           
                                        }
                                        nearbyService.send(object: lancid20, type: DataType.d20.rawValue)
                                        lancid20.removeAll()
                                    case 8:
                                        for j in 0..<numDice[i]
                                        {
                                            var roll = Int.random(in: 1...100)
                                            lancid100.append(roll)
                                            print(lancid100[j])
                                        }
                                    default:
                                        break
                                    }
                                }
                            
                            }
                            
                            
                        numDice = [0,0,0,0,0,0,0,0,0]
                            print(numDice)
                        }) {
                            Text("Roll")
                                //                        .foregroundColor(.purple)
                                .frame(width: 120, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                .cornerRadius(40)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                        }
                        Button(action:{
                                nearbyService.send(object: canClear, type: DataType.clear.rawValue)
                            numDice = [0,0,0,0,0,0,0,0,0]
                            self.diceContainer.diceArray.removeAll()
                            List{
                                ForEach(diceContainer.diceArray, id: \.id) { ciao in
                                    Text("You rolled: D\(ciao.dice)")
                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                        .font(.system(size: 18, design: .default))
                                }
                                .listRowBackground(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                
                            }
                            

                        }
                        ) {
                            Text("Clear")
                                //                        .foregroundColor(.purple)
                                .frame(width: 120, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                                .cornerRadius(40)
                                .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                                .font(.system(size: 18, weight: .heavy, design: .default))
                        }
                        
                        //                    Button(action: {print(numD2)}) {
                        //                        Text("Dice history")
                        //                            .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        //                            .padding()
                        //                            .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        //                            .cornerRadius(40)
                        //                            .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        //                            .font(.system(size: 18, weight: .heavy, design: .default))
                        //                    }
//                        NavigationLink("History", destination:
//                                        ZStack {
//                                            Image("background")
//                                                .resizable()
//                                                .edgesIgnoringSafeArea(.all)
//                                            List{
//                                                ForEach(diceContainer.diceArray, id: \.id) { ciao in
//                                                    Text("Hai tirato: D\(ciao.dice)")
//                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
//                                                        .font(.system(size: 18, design: .default))
//                                                }
//                                                .listRowBackground(Color.init(red: 47/255, green: 31/255, blue: 22/255))
//
//                                            }
//                                        }
//
//                        )
                        .frame(width: 120, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.init(red: 47/255, green: 31/255, blue: 22/255))
                        .cornerRadius(40)
                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
                        .font(.system(size: 18, weight: .heavy, design: .default))
                    }
                    
                    Spacer()
                    
                    
                    //                MARK: Navbar buttons
                    
                    
                    
                    
                }.navigationBarTitle("Dice")
//                .navigationBarItems(trailing:
//                                        NavigationLink("History", destination:
//                                                        ZStack {
//                                                            Image("background")
//                                                                .resizable()
//                                                                .edgesIgnoringSafeArea(.all)
//                                                            List{
//                                                                ForEach(diceContainer.diceArray, id: \.id) { ciao in
//                                                                    Text("You rolled: D\(ciao.dice)")
//                                                                        .foregroundColor(Color.init(red: 241/255, green: 215/255, blue: 153/255))
//                                                                        .font(.system(size: 18, design: .default))
//                                                                }
//                                                                .listRowBackground(Color.init(red: 47/255, green: 31/255, blue: 22/255))
//
//                                                            }
//                                                        }
//
//                                        )
//                                        NavigationLink("Send", destination:
//                                                        ZStack {
//                                                            Image("background")
//                                                                .resizable()
//                                                                .edgesIgnoringSafeArea(.all)
//                                                            Text("Pass the Siri Remote and shake it to roll the dice!")
//                                                                .padding(.horizontal, 30)
//                                                                .multilineTextAlignment(.center)
//                                                                .foregroundColor(Color.init(red: 47/255, green: 31/255, blue: 22/255))
//                                                                .font(.system(size: 18, weight: .heavy, design: .default))
//                                                        }.navigationBarTitle("Send")
//                                        )
//                )
                .padding(.top, 50)
            }.onAppear {
                self.nearbyService.nearbyServiceDelgate = self
            }
        }
    }
}
extension diceView: NearbyServiceDelegate{
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
