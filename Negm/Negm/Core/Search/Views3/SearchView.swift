//
//  SearchView.swift
//  Negm
//
//  Created by abdallah negm on 19/08/2024.

import SwiftUI

struct SearchView: View {
    
    @State private var carMake: String = ""
    @State private var carModel: String = ""
    @State private var yearFrom: String = ""
    @State private var yearTo: String = ""
    @State private var distanceFrom: String = ""
    @State private var distanceTo: String = ""
    
    @State private var showCarMakePicker = false
    @State private var showCarModelPicker = false
    
    @State private var selectedCarType: String? = nil
    
    let carMakes = [
        "Toyota", "Honda", "Ford", "BMW", "Mercedes", "Nissan", "Chevrolet", "Kia", "Hyundai", "Volkswagen",
        "Audi", "Lexus", "Mazda", "Subaru", "Dodge", "Jeep", "Tesla", "Volvo", "Land Rover", "Jaguar",
        "Ferrari", "Lamborghini", "Porsche", "Mitsubishi", "Acura", "Infiniti", "Mini", "Bentley", "Buick",
        "Cadillac", "Chrysler", "Fiat", "Genesis", "GMC", "Lincoln", "Maserati", "Peugeot", "Renault", "Rolls-Royce",
        "Suzuki", "Tata", "Alfa Romeo", "Aston Martin", "Citroen", "DS Automobiles", "Hummer", "Isuzu", "Lancia", "Saab",
        "Scion", "Seat", "Skoda", "Smart", "SsangYong"
    ]
    
    let carModels: [String: [String]] = [
        "Toyota": ["Corolla", "Camry", "Prius", "Yaris", "Highlander", "Land Cruiser"],
        "Honda": ["Civic", "Accord", "Fit", "CR-V", "Pilot", "Ridgeline"],
        "Ford": ["Fiesta", "Focus", "Mustang", "Explorer", "F-150", "Ranger"],
        "BMW": ["3 Series", "5 Series", "7 Series", "X1", "X3", "X5"],
        "Mercedes": ["A-Class", "C-Class", "E-Class", "S-Class", "GLA", "GLE"],
        "Nissan": ["Altima", "Sentra", "Maxima", "Rogue", "Murano", "Pathfinder"],
        "Chevrolet": ["Spark", "Malibu", "Impala", "Equinox", "Tahoe", "Silverado"],
        "Kia": ["Rio", "Optima", "Sportage", "Sorento", "Telluride", "Stinger"],
        "Hyundai": ["Elantra", "Sonata", "Tucson", "Santa Fe", "Palisade", "Veloster"],
        "Volkswagen": ["Golf", "Passat", "Jetta", "Tiguan", "Atlas", "Arteon"],
        "Audi": ["A3", "A4", "A6", "Q3", "Q5", "Q7"],
        "Lexus": ["IS", "ES", "GS", "RX", "NX", "LX"],
        "Mazda": ["Mazda3", "Mazda6", "CX-3", "CX-5", "CX-9", "MX-5"],
        "Subaru": ["Impreza", "Legacy", "Outback", "Forester", "Crosstrek", "Ascent"],
        "Dodge": ["Challenger", "Charger", "Durango", "Journey", "Grand Caravan", "Ram"],
        "Jeep": ["Wrangler", "Cherokee", "Grand Cherokee", "Compass", "Renegade", "Gladiator"],
        "Tesla": ["Model S", "Model 3", "Model X", "Model Y"],
        "Volvo": ["S60", "S90", "V60", "XC40", "XC60", "XC90"],
        "Land Rover": ["Range Rover", "Range Rover Sport", "Discovery", "Defender"],
        "Jaguar": ["XE", "XF", "XJ", "F-Pace", "E-Pace", "I-Pace"],
        "Ferrari": ["488", "F8", "Portofino", "Roma", "812", "SF90"],
        "Lamborghini": ["Huracan", "Aventador", "Urus"],
        "Porsche": ["911", "Cayenne", "Macan", "Panamera", "Taycan"],
        "Mitsubishi": ["Mirage", "Lancer", "Outlander", "Pajero", "Eclipse Cross"],
        "Acura": ["ILX", "TLX", "RLX", "RDX", "MDX"],
        "Infiniti": ["Q50", "Q60", "Q70", "QX50", "QX60", "QX80"],
        "Mini": ["Cooper", "Countryman", "Clubman"],
        "Bentley": ["Continental", "Flying Spur", "Bentayga"],
        "Buick": ["Enclave", "Encore", "Envision"],
        "Cadillac": ["ATS", "CTS", "XT5", "Escalade"],
        "Chrysler": ["200", "300", "Pacifica"],
        "Fiat": ["500", "500X", "Panda"],
        "Genesis": ["G70", "G80", "G90"],
        "GMC": ["Acadia", "Terrain", "Yukon", "Sierra"],
        "Lincoln": ["MKC", "MKZ", "Navigator", "Corsair"],
        "Maserati": ["Ghibli", "Levante", "Quattroporte"],
        "Peugeot": ["208", "308", "508", "2008", "3008", "5008"],
        "Renault": ["Clio", "Megane", "Kadjar", "Koleos"],
        "Rolls-Royce": ["Ghost", "Wraith", "Dawn", "Phantom", "Cullinan"],
        "Suzuki": ["Swift", "Vitara", "Jimny"],
        "Tata": ["Tiago", "Nexon", "Harrier"],
        "Alfa Romeo": ["Giulia", "Stelvio"],
        "Aston Martin": ["DB11", "Vantage", "DBX"],
        "Citroen": ["C3", "C4", "C5 Aircross"],
        "DS Automobiles": ["DS 3", "DS 7", "DS 9"],
        "Hummer": ["H1", "H2", "H3"],
        "Isuzu": ["D-Max", "MU-X"],
        "Lancia": ["Ypsilon"],
        "Saab": ["9-3", "9-5"],
        "Scion": ["tC", "FR-S"],
        "Seat": ["Ibiza", "Leon", "Ateca"],
        "Skoda": ["Octavia", "Superb", "Kodiaq"],
        "Smart": ["Fortwo", "Forfour"],
        "SsangYong": ["Tivoli", "Korando", "Rexton"]
    ]
    
    var groupedCarMakes: [String: [String]] {
        Dictionary(grouping: carMakes, by: { String($0.prefix(1)) })
            .mapValues { $0.sorted() }
            .sorted(by: { $0.key < $1.key })
            .reduce(into: [:]) { result, entry in
                result[entry.key] = entry.value
            }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Car Make Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Marka")
                        .font(.headline)
                    Button(action: {
                        showCarMakePicker.toggle()
                    }) {
                        Text(carMake.isEmpty ? "select" : carMake)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                    }
                    .sheet(isPresented: $showCarMakePicker) {
                        NavigationView {
                            List {
                                ForEach(groupedCarMakes.keys.sorted(), id: \.self) { letter in
                                    Section(header: Text(letter).font(.headline)) {
                            ForEach(groupedCarMakes[letter] ?? [], id: \.self) { make in
                                    Text(make)
                                        .onTapGesture {
                                        carMake = make
                                    carModel = "" // Clear car model when a new make is selected
                                        showCarMakePicker.toggle()
                                }
                        }
                    }
                }
            }
                .navigationBarTitle("اختيار نوع السيارة", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        showCarMakePicker.toggle()
                    }) {
                       Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            })
                        }
                    }
                }
                
                // Car Model Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Model")
                        .font(.headline)
                    Button(action: {
                        showCarModelPicker.toggle()
                    }) {
                        Text(carModel.isEmpty ? "select" : carModel)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.gray, lineWidth: 1)
                            )
                    }
            .sheet(isPresented: $showCarModelPicker) {
                    NavigationView {
                        List {
                            ForEach(carModels[carMake] ?? [], id: \.self) { model in
                                    Text(model)
                                        .onTapGesture {
                                            carModel = model
                                            showCarModelPicker.toggle()
                                        }
                                }
                            }
                            .navigationBarTitle("اختيار موديل السيارة", displayMode: .inline)
                            .navigationBarItems(leading: Button(action: {
                                showCarModelPicker.toggle()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                }
                
                // Year From/To Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("سنة الصنع")
                        .font(.headline)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            TextField("From", text: $yearFrom)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .onChange(of: yearFrom) { newValue in
                                    if newValue.count > 4 {
                                        yearFrom = String(newValue.prefix(4))
                                    }
                                }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            TextField("To", text: $yearTo)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .onChange(of: yearTo) { newValue in
                                    if newValue.count > 4 {
                                        yearTo = String(newValue.prefix(4))
                                    }
                                }
                        }
                    }
                }
                
                // Distance From/To Selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("المسافة (كم)")
                        .font(.headline)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            TextField("From", text: $distanceFrom)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .onChange(of: distanceFrom) { newValue in
                                    if newValue.count > 6 {
                                        distanceFrom = String(newValue.prefix(6))
                                    }
                                }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            TextField("To", text: $distanceTo)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .onChange(of: distanceTo) { newValue in
                                    if newValue.count > 6 {
                                        distanceTo = String(newValue.prefix(6))
                                    }
                                }
                        }
                    }
                }
                
                // Search Button
                Button(action: {
                    print("بحث عن نوع السيارة: \(carMake), موديل السيارة: \(carModel), سنة الصنع من: \(yearFrom) إلى: \(yearTo), المسافة من: \(distanceFrom) كم إلى: \(distanceTo) كم")
                }) {
                    Text("Search")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brown)
                        .cornerRadius(50)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Search", displayMode: .inline)
           
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}





// عملت ان المسافه مش هاتزيد عن ٦ ارقام
// وعملت سنه الصنع مش هاتزيد عن ٤ ارقام وعملت بدايه من ١٩٨٠ الي ٢٠٢٤
//في مشكله اني مختار ان لوحه مفاتيخ ارقام تظهر اول ما اضغط علي تحديد الرقم في اي واحده ومفيش حاجه ظهرت 
