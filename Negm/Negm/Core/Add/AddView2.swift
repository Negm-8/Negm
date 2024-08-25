//
//  SellView.swift
//  Negm
//
//  Created by abdallah negm on 20/08/2024.
//

import SwiftUI
import PhotosUI

struct AddView2: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: AddCarView()) {
                            Text("Sell")
                                .frame(width: 160, height: 160)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(19)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        
                        NavigationLink(destination: AddServiceView()) {
                            Text("Add Service")
                                .frame(width: 160, height: 160)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(19)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
            }
            .navigationTitle("Add")
        }
    }
}

struct AddCarView: View {
    @State private var selectedMake: String? = nil
    @State private var selectedModel: String? = nil
    
    @State private var makeOptions: [String] =
    
    [
        "Toyota", "Honda", "Ford", "BMW", "Mercedes", "Nissan", "Chevrolet", "Kia", "Hyundai", "Volkswagen",
        "Audi", "Lexus", "Mazda", "Subaru", "Dodge", "Jeep", "Tesla", "Volvo", "Land Rover", "Jaguar",
        "Ferrari", "Lamborghini", "Porsche", "Mitsubishi", "Acura", "Infiniti", "Mini", "Bentley", "Buick",
        "Cadillac", "Chrysler", "Fiat", "Genesis", "GMC", "Lincoln", "Maserati", "Peugeot", "Renault", "Rolls-Royce",
        "Suzuki", "Tata", "Alfa Romeo", "Aston Martin", "Citroen", "DS Automobiles", "Hummer", "Isuzu", "Lancia", "Saab",
        "Scion", "Seat", "Skoda", "Smart", "SsangYong"
    ]
    
    
    
    @State private var makeModels: [String: [String]] = [
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
    
    @State private var showMakes = false
    @State private var showModels = false
    
    @State private var make: String = ""
    @State private var model: String = ""
    @State private var price: String = ""
    @State private var year: String = ""
    @State private var mileage: String = ""
    @State private var description: String = ""
    
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var imageSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showAlert = false
    @State private var showQuestionAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Button(action: { showMakes.toggle() }) {
                    HStack {
                        Text("Make")
                        Spacer()
                        Text(selectedMake ?? "Select Make")
                            .foregroundColor(.gray)
                    }
                }
                .actionSheet(isPresented: $showMakes) {
                    ActionSheet(
                        title: Text("Select Make"),
                        buttons: makeOptions.map { make in
                            .default(Text(make)) {
                                self.selectedMake = make
                                self.selectedModel = nil
                                showModels = true
                            }
                        } + [.cancel()]
                    )
                }
                
                if let selectedMake = selectedMake {
                    Button(action: { showModels.toggle() }) {
                        HStack {
                            Text("Model")
                            Spacer()
                            Text(selectedModel ?? "Select Model")
                                .foregroundColor(.gray)
                        }
                    }
                    .actionSheet(isPresented: $showModels) {
                        let models = makeModels[selectedMake] ?? []
                        return ActionSheet(
                            title: Text("Select Model"),
                            buttons: models.map { model in
                                .default(Text(model)) {
                                    self.selectedModel = model
                                }
                            } + [.cancel()]
                        )
                    }
                }
                
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                    .onChange(of: price) { newValue in
                        // Restrict input to 8 characters
                        if newValue.count > 8 {
                            price = String(newValue.prefix(8))
                        }
                    }
                
                TextField("Year", text: $year)
                    .keyboardType(.numberPad)
                    .onChange(of: year) { newValue in
                        // Restrict input to 4 characters
                        if newValue.count > 4 {
                            year = String(newValue.prefix(4))
                        }
                    }
                
                TextField("Mileage (km)", text: $mileage)
                    .keyboardType(.decimalPad)
                TextField("Description", text: $description)
                
                Button(action: {
                    self.showQuestionAlert = true
                }) {
                    Text("Add Image")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showQuestionAlert) {
                    Alert(
                        title: Text("Add Image"),
                        message: Text("Would you like to add a photo from your gallery or use the camera?"),
                        primaryButton: .default(Text("Photo Library")) {
                            self.imageSourceType = .photoLibrary
                            self.showImagePicker = true
                        },
                        secondaryButton: .default(Text("Camera")) {
                            self.imageSourceType = .camera
                            self.showImagePicker = true
                        }
                    )
                }
                
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            
            Button(action: {
                saveCarData()
            }) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Add Car")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: imageSourceType, selectedImage: $selectedImage)
        }
    }
    
    func saveCarData() {
        // Implement the function to save car data
        print("Car Data Submitted: \(make), \(model), \(price), \(year), \(mileage), \(description)")
    }
}

struct AddServiceView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Button(action: {
                    // Action for "View Cars for Rent"
                }) {
                    Text("View Cars for Rent")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.headline)
                }
                
                Button(action: {
                    // Action for "Airport Transfer"
                }) {
                    Text("Airport Transfer")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.headline)
                }
                
                Button(action: {
                    // Action for "Intercity Minibus"
                }) {
                    Text("Intercity Minibus")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.headline)
                }
                
                Button(action: {
                    // Action for "Wedding Cars"
                }) {
                    Text("Wedding Cars")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.headline)
                }
            }
            .padding()
        }
        .navigationTitle("Add Service")
        .background(Color.gray.ignoresSafeArea())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AddView2()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
