//Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport
/*
 1、如果我们写了一个函数，或者自定义了一个 view，这部分代码一般情况下是不会变的，而编译器却会一次又一次地去编译这些代码，最终的结果就是导致效率的低下。
 
 Sources 目录就派上用场了，使用 Cmd + 1 打开项目导航栏(Project Navigator)，可以看到一个 Sources 目录。放到此目录下的源文件会被编译成模块(module)并自动导入到 Playground 中，并且这个编译只会进行一次(或者我们对该目录下的文件进行修改的时候)，而非每次你敲入一个字母的时候就编译一次。 这将会大大提高代码执行的效率。
 
 2、Playground 提供了两个地方来存储资源，一个是每个 Playground 都独立的资源，而另一个是所有 Playground 都共享的资源。
 目录的资源是直接放到 mainBundle 中的，可以使用如下代码来获取资源路径：
 如果是图片文件，也可以直接使用UIImage(named:)来获取。
 */

if let path = Bundle.main.path(forResource: "example", ofType: "JSON") {
    // do something with json
}


/*
 Playground 已经原生支持 markdown 注释渲染，只需要在单行或多行注释的后面添加冒号:，标记这是一个 markdown 注释
 下面是一些swift的连接，可以用来学习
 */
/*:
 ### Lists of Links
 
 - [NSHipster](http://nshipster.com)
 - [ASCIIwwdc](http://asciiwwdc.com)
 - [SwiftDoc](http://swiftdoc.org)
 
 ### Images,Too
 ![Remote Image](http://nshipster.s3.amazonaws.com/alert.gif)
 ![Local Image](bomb.png)
 
 *Images in the Resources directory can be referenced locally*
 
 */

/*
 Playground 支持多页面，这可以让我们将不同类别的代码分别写到不同的页面下，并可以在多个页面之间进行跳转。
 在项目导航栏中，选择File > New > Playground Page， 就可以新建一个页面，或者选择项目导航栏左下角的 + 号选择 New Page。
 */

/*
 页面跳转
 
 Playground 支持三种方式的页面跳转：
 
 上一页
 下一页
 跳转到指定页
 页面顺序都是根据它们在项目文件中的排序来决定的。
 
 上一页与下一页的语法：
 //: ["Go to Next Page"](@next)
 
 //: ["Go to Previous Page"](@previous)
 */

//下面例子，打开AssitantView可以看到图形变化
var wrap = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var rect = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

rect.center = wrap.center
rect.backgroundColor = UIColor.red
wrap.addSubview(rect)

//animation
UIView.animate(withDuration: 3){
    rect.backgroundColor = UIColor.green
    rect.frame = wrap.frame
}

//XCPlaygroundPage.currentPage.liveView=wrap
PlaygroundPage.current.liveView=wrap











