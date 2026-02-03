//
//  PageCurlView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI
import UIKit

struct PageCurlView: UIViewControllerRepresentable {

    let pages: [UIViewController]  

    func makeUIViewController(context: Context) -> UIPageViewController {

        let controller = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal,
            options: nil
        )

        controller.dataSource = context.coordinator

        if let first = pages.first {
            controller.setViewControllers([first], direction: .forward, animated: false)
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource {

        let parent: PageCurlView

        init(_ parent: PageCurlView) {
            self.parent = parent
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {

            guard
                let index = parent.pages.firstIndex(of: viewController),
                index > 0
            else { return nil }

            return parent.pages[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {

            guard
                let index = parent.pages.firstIndex(of: viewController),
                index < parent.pages.count - 1
            else { return nil }

            return parent.pages[index + 1]
        }
    }
}
