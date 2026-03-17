import SwiftUI

struct GmailConnectView: View {
    @Binding var isPresented: Bool
    @State private var isLoading = false
    @State private var showSuccess = false
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with Cancel button
                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                
                // Main content
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(alignment: .center, spacing: 12) {
                            Image(systemName: "envelope.badge.shield.half.filled")
                                .font(.system(size: 48))
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .center, spacing: 6) {
                                Text("Connect Gmail")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text("Import banking emails")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 12)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            PermissionItem(
                                icon: "envelope.fill",
                                title: "Read Bank Emails",
                                description: "Access banking alerts & statements"
                            )
                            
                            PermissionItem(
                                icon: "lock.fill",
                                title: "Secure Processing",
                                description: "All data processed locally on device"
                            )
                            
                            PermissionItem(
                                icon: "chart.bar.fill",
                                title: "Smart Analysis",
                                description: "Extract transactions automatically"
                            )
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                    .padding()
                }
                
                // Action buttons
                VStack(spacing: 12) {
                    if isLoading {
                        HStack(spacing: 8) {
                            ProgressView()
                            Text("Connecting to Gmail...")
                                .font(.subheadline)
                        }
                        .foregroundColor(.blue)
                        .padding()
                    } else if showSuccess {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Gmail Connected!")
                                .font(.subheadline)
                        }
                        .padding()
                    } else {
                        Button(action: connectGmail) {
                            HStack(spacing: 8) {
                                Image(systemName: "envelope.badge.shield.half.filled")
                                Text("Connect with Gmail")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.2, green: 0.4, blue: 1.0),
                                        Color(red: 0.0, green: 0.3, blue: 0.9)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .font(.headline)
                        }
                        
                        Button(action: { isPresented = false }) {
                            Text("Not Now")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private func connectGmail() {
        isLoading = true
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isLoading = false
            showSuccess = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isPresented = false
            }
        }
    }
}

struct PermissionItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PermissionItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

#Preview {
    GmailConnectView(isPresented: .constant(true))
}
