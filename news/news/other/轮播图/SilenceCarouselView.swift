//
//  SilenceCarouselView.swift
//  SilenceIOS_Swift
//  轮播控件
//  Created by SilenceMac on 16/5/7.
//  Copyright © 2016年 Silence. All rights reserved.
//

import UIKit
import Kingfisher
/// 点击事件回调
public typealias SilenceCarouselViewTapBlock = ((_ carouselView: SilenceCarouselView, _ index:Int) -> ())

/*
 实现原理参考：http://www.tuicool.com/articles/yE73ia
 本插件加载网络图片使用的框架是喵神王巍的Kingfisher：https://github.com/onevcat/Kingfisher
 
 */
/// 轮播控件
open class SilenceCarouselView: UIView,UIScrollViewDelegate {
    
    /**
     定义手指滑动方向枚举
     
     - DirecNone:  没有动
     - DirecLeft:  向左
     - DirecRight: 向右
     */
    enum CarouselViewDirec {
        case direcNone
        case direcLeft
        case direcRight
    }

    /// 点击事件回调
    var silenceCarouselViewTapBlock:SilenceCarouselViewTapBlock?
    
    /// 滚动主视图
    var scrollView:UIScrollView?
    
        /// 小圆点
    var pageControl:UIPageControl?
    
        /// 间隔时间
    var time:TimeInterval = 1.8
    
        /// 要展示的图片数组
    var imageArray:[AnyObject]?
    
    /// 要展示的标题
    var titleArray:[NSString]?
    
        /// 定时器
    fileprivate var timer:Timer?
    
        /// 当前显示的图片
    fileprivate var currentImgView:UIImageView?
    
        /// 左右滑动时设置的图片
    fileprivate var otherImgView:UIImageView?
    
    /// 当前显示的图片标题
    fileprivate var currentImgViewTitle:UILabel?
    
    /// 左右滑动时设置的图片标题
    fileprivate var otherImgViewTitle:UILabel?
    
        /// 当前图片索引
    fileprivate var currIndex = 0
    
        /// 下一图片索引
    fileprivate var nextIndex = 1
    
        /// 当前的滚动方向
    fileprivate var currentDirec:CarouselViewDirec = .direcNone
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    /**
     解决timer被强引用无法释放的问题
     */
    open override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil && timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    deinit{
        /**
         *  移除计时器
         */
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    /**
     自定义的初始化方法
     
     - parameter frame:                       frame
     - parameter imageArray:                  图片数组：可以是UIImage、NSURL、String
     - parameter silenceCarouselViewTapBlock: 回调闭包
     
     - returns: 初始化成功的轮播对象
     */
    init(frame: CGRect,imageArray: [AnyObject],titleAry: [NSString],silenceCarouselViewTapBlock: @escaping SilenceCarouselViewTapBlock) {
        super.init(frame: frame)
        self.imageArray = imageArray
        self.titleArray = titleAry
        self.silenceCarouselViewTapBlock = silenceCarouselViewTapBlock
        self.reload()
    }
    
    
    /**
     重新重置加载轮播
     */
    func reload(){
        initTimer()
        initView()
    }
    
    /**
     初始化计时器
     */
    fileprivate func initTimer() -> (){
        //如果只有一张图片，则直接返回，不开启定时器
        if self.imageArray!.count <= 1 {
            return
        }
        //如果定时器已开启，先停止再重新开启
        if timer != nil {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: self.time, target: self, selector: #selector(SilenceCarouselView.timerFunction), userInfo: nil, repeats: true)
        //        timer?.fire()
        RunLoop.current.add(self.timer!, forMode: RunLoopMode.defaultRunLoopMode)

    }
    
    /**
     定时调用的方法
     */
    func timerFunction() -> (){
        //动画改变scrollview的偏移量就可以实现自动滚动
        self.scrollView?.setContentOffset(CGPoint(x: self.scrollView!.bounds.size.width * 2, y: 0), animated: true)
    }

    
    /**
     初始化滚动视图数据
     */
    fileprivate func initView() -> (){
        if self.scrollView == nil {
            self.scrollView = UIScrollView.init(frame: self.bounds)
            self.scrollView?.isPagingEnabled = true
            self.scrollView?.showsHorizontalScrollIndicator = false
            self.scrollView?.showsVerticalScrollIndicator = false
            self.scrollView?.delegate = self
            self.addSubview(self.scrollView!)
            
            self.otherImgView = UIImageView(frame: self.bounds)
            self.otherImgViewTitle = UILabel (frame: CGRect.init(x: 0, y: self.bounds.size.height - 34, width: self.bounds.size.width, height: 34))
             self.otherImgViewTitle?.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
            self.otherImgView?.addSubview(self.otherImgViewTitle!)
            self.otherImgView?.isUserInteractionEnabled = true
            //            self.otherImgView!.contentMode = .scaleAspectFit
            self.otherImgView!.contentMode = .scaleAspectFill
            
            self.otherImgView!.clipsToBounds = true;
            self.scrollView!.addSubview(self.otherImgView!)
            self.otherImgView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SilenceCarouselView.clickImg)))
            
            self.currentImgView = UIImageView(frame: self.bounds)
            self.currentImgViewTitle = UILabel (frame: CGRect.init(x: 0, y: self.bounds.size.height - 34, width: self.bounds.size.width, height: 34))
            self.currentImgViewTitle?.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
            self.currentImgView?.addSubview(self.currentImgViewTitle!)
            self.currentImgView?.isUserInteractionEnabled = true
            //            self.currentImgView!.contentMode = .scaleAspectFit
            self.currentImgView!.contentMode = .scaleAspectFill
            self.currentImgView!.clipsToBounds = true;
            self.currentImgView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SilenceCarouselView.clickImg)))
            self.scrollView!.addSubview(self.currentImgView!)
            
            self.pageControl = UIPageControl(frame: CGRect(x: 0,y: self.bounds.size.height - 20,width: self.bounds.size.width, height: 30))
            self.pageControl?.currentPageIndicatorTintColor = UIColor.red
            self.pageControl?.pageIndicatorTintColor = UIColor.white
            self.addSubview(self.pageControl!)
        }
        self.scrollView?.frame = self.bounds
        // 设置内容宽度为3倍的尺寸
        self.scrollView?.contentSize = CGSize(width: self.bounds.size.width * 3, height: self.bounds.size.height)
        // 设置当前显示的图片
        self.currentImgView?.frame = CGRect(x: self.bounds.size.width,y: 0,width: self.bounds.size.width, height: self.bounds.size.height)
        self.loadImg(self.currentImgView!, index: 0)
        self.currentImgViewTitle?.text = self.titleArray?[0] as String?
        // 设置页数
        self.pageControl?.numberOfPages = self.imageArray!.count
        self.pageControl?.currentPage = 0
        self.pageControl?.hidesForSinglePage = true
        // 设置显示的位置
        self.scrollView?.contentOffset = CGPoint(x: self.bounds.size.width, y: 0)
        // 设置整个轮播图片的显示逻辑
        self.reloadImg()
        //为一张图片的时候
        if self.pageControl?.numberOfPages == 1 {
            self.scrollView?.contentSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
            self.scrollView?.contentOffset = CGPoint(x: 0, y: 0)
            self.currentImgView?.frame = CGRect(x: 0,y: 0,width: self.bounds.size.width, height: self.bounds.size.height)
        }
    }
    
    /**
     图片点击事件
     */
    func clickImg() -> (){
        if self.silenceCarouselViewTapBlock != nil {
            self.silenceCarouselViewTapBlock!(self,self.pageControl!.currentPage)
        }
    }
    
    /**
     设置整个轮播图片的显示逻辑
     */
    fileprivate func reloadImg() -> (){
        self.currentDirec = .direcNone;//清空滚动方向
        //判断最终是滚到了右边还是左边
        let index = self.scrollView!.contentOffset.x / self.scrollView!.bounds.size.width;
        //等于1表示最后没有滚动，返回不做任何操作
        if index == 1 {return}
         //当前图片索引改变
        self.currIndex = self.nextIndex;
        self.pageControl!.currentPage = self.currIndex
        // 将当前图片的位置放到中间
        self.currentImgView!.frame = CGRect(x: self.scrollView!.bounds.size.width, y: 0, width: self.scrollView!.bounds.size.width, height: self.scrollView!.bounds.size.height)
        // 将其他图片对象的图片给当前显示的图片
        self.currentImgView!.image = self.otherImgView!.image
        self.currentImgViewTitle?.text = self.otherImgViewTitle?.text
        // 设置视图滚到中间位置
        self.scrollView!.contentOffset = CGPoint(x: self.scrollView!.bounds.size.width, y: 0)
    }
    
    /**
     加载图片
     
     - parameter imgView: 需要加载图片的 UIImageView
     - parameter index:   加载图片的索引
     */
    fileprivate func loadImg(_ imgView:UIImageView,index:Int){
        let imgData = self.imageArray![index]
        // 如果是字符串类型，就去拼接URL
        if imgData is String {
            // MARK: - 此处可以换成别的网络图片加载逻辑
            if(imgData as! String == ""){
                imgView.sd_setImage(with: URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502945051392&di=b7b70b6e7e80270ce853168ba2cfe9b6&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F20%2F02%2F16pic_2002642_b.jpg")!, placeholderImage: nil)
            }else{
                imgView.sd_setImage(with: URL(string: imgData as! String)!, placeholderImage: nil)
            }

        }
        // 如果是NSURL类型则直接去加载
        else if imgData is URL {
            // MARK: - 此处可以换成别的网络图片加载逻辑
            imgView.sd_setImage(with: imgData as? URL, placeholderImage: nil)
        }
        // 图片类型
        else if imgData is UIImage {
            imgView.image = imgData as? UIImage
        }
        // 其他未找到为空
        else{
            imgView.image = nil
        }
    }
    

    
    //MARK: - UIScrollView代理方法
    
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 开始拖动时停止自动轮播
        self.timer?.invalidate()
    }
    
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // 结束拖动时开启自动轮播
        self.initTimer()
    }
    
    open func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 带动画的设置scrollview位置后会调用此方法
        self.reloadImg() // 设置图片
    }
    
    
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 结束滚动时重置方向
        self.currentDirec = .direcNone
        // 设置图片
        self.reloadImg()
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 设置手指滑动方向
        self.currentDirec = scrollView.contentOffset.x > scrollView.bounds.size.width ? .direcLeft : .direcRight;
        // 向右滑
        if self.currentDirec == .direcRight {
            // 将其他图片显示到左边
            self.otherImgView!.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height);
            // 下一索引-1
            self.nextIndex = self.currIndex - 1
            // 当索引 < 0 时, 显示最后一张图片
            if self.nextIndex < 0 {
                self.nextIndex = self.imageArray!.count - 1
            }
        }
        // 向左滑动
        else if self.currentDirec == .direcLeft {
             // 将其他图片显示到右边
            self.otherImgView!.frame = CGRect(x: self.currentImgView!.frame.maxX, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height);
            // 设置下一索引
            self.nextIndex = (self.currIndex + 1) % self.imageArray!.count
        }
        // 去加载图片
        self.loadImg(self.otherImgView!, index: self.nextIndex)
        self.otherImgViewTitle?.text = self.titleArray?[self.nextIndex] as String?
    }
    
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
