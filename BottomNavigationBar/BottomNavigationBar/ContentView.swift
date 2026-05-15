//
//  ContentView.swift
//  BottomNavigationBar
//
//  Created by 김대경 on 11/6/25.
//

import SwiftUI

// MARK: - 메인 ContentView
struct ContentView: View {
    var body: some View {
        MainView()
    }
}


// MARK: - Screen Enum
enum Screen: String, CaseIterable {
    case home = "홈/Home"
    case search = "검색/Search"
    case settings = "설정/Settings"

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .settings: return "gearshape.fill"
        }
    }

    var title: String {
        self.rawValue
    }
}

// MARK: - Main View
struct MainView: View {
    @State private var selectedTab: Screen = .home

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // 상단 App Bar / Top app bar
                TopBar(title: selectedTab.title)

                // 본문 (탭에 따른 화면 전환) / Body (Screen switching according to tab)
                ZStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .search:
                        SearchView()
                    case .settings:
                        SettingsView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))

                // 하단 네비게이션 바 / Bottom navigation bar
                BottomNavigationBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

// MARK: - Top Bar (상단 앱바)
struct TopBar: View {
    var title: String
    @State private var showLeftMenu = false
    @State private var showRightMenu = false

    var body: some View {
        HStack {
            // 왼쪽 메뉴 버튼 / left menu button
            Menu {
                Button("메뉴1/Menu1", action: { print("메뉴1 선택") })
                Button("메뉴2/Menu2", action: { print("메뉴2 선택") })
            } label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .padding(.leading, 16)
            }

            Spacer()

            Text(title)
                .font(.headline)

            Spacer()

            // 오른쪽 드롭다운 메뉴 / Right drop-down menu
            Menu {
                Button("설정 변경/Change Settings", action: { print("설정 변경 선택 / Select Change Settings") })
                Button("로그아웃/Log out", action: { print("로그아웃 선택 / Select logout") })
            } label: {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .font(.title2)
                    .padding(.trailing, 16)
            }
        }
        .frame(height: 50)
        .background(Color(.systemGray6))
    }
}

// MARK: - Bottom Navigation Bar (하단 탭바)
struct BottomNavigationBar: View {
    @Binding var selectedTab: Screen

    var body: some View {
        HStack {
            ForEach(Screen.allCases, id: \.self) { screen in
                Spacer()

                VStack {
                    Image(systemName: screen.icon)
                        .font(.system(size: 22))
                    Text(screen.title)
                        .font(.caption)
                }
                .foregroundColor(selectedTab == screen ? .blue : .gray)
                .onTapGesture {
                    withAnimation {
                        selectedTab = screen
                    }
                }

                Spacer()
            }
        }
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
    }
}

// 스크린 / Screens
struct HomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("홈 화면입니다. / Home Screen")
            Spacer()
        }
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("검색 화면입니다. / Search Screen")
            Spacer()
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("설정 화면입니다./ Settings Screen")
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}
