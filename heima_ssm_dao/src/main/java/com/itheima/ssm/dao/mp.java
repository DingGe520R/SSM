package com.itheima.ssm.dao;
import java.util.Scanner;
    interface Shape{
        public abstract double getArea();
        public abstract double getCircumference();
    }
    class Circle implements Shape {
        private double r=0;
        public Circle(double r) {
            this.r=r;}
        public double getR(){
            return this.r; }
        public double getArea() {
            return (3.14*this.r*this.r);}
        public double getCircumference(){
            return 2*3.14*this.r;
        }
    }
    class Triangle implements Shape {
        private double a=0;
        private double b=0;
        private double c=0;
        public Triangle(double a, double b, double c) {
            this.a=a;
            this.b=b;
            this.c=c;}
        public double getA() {
            return this.a;}
        public double getB() {
            return this.b;}
        public double getC() {
            return this.c;}
        public double getArea() {
// 根据海伦公式求三角形的面积
            double p=(a+b+c)/2;
            return Math.pow(p*(p-a)*(p-b)*(p-c),0.5);}
        public double getCircumference(){
            return this.a+this.b+this.c;
        }
    }
    class Rentangle implements Shape{
        public double height=0;
        public double width=0;
        public Rentangle(double height, double width){
            this.height = height;
            this.width = width;}
        public double getHeight(){
            return this.height; }
        public double getWidth(){
            return this.width;}
        public double getArea(){
            return this.height*this.width;
        }
        public double getCircumference(){
            return 2*(this.height+this.width);
        }
    }
    public class mp {
        public static void main(String[] args){
            Scanner input = new Scanner(System.in);
            double r=0;
            double a=0;
            double b=0;
            double c=0;
            double height=0;
            double width=0;
            do{
                System.out.println("请输入圆的半径r：");
                r= input.nextDouble();
                if (r<=0) {
                    System.out.print("输入错误!!!");
                }
            }while (r<=0);
            do {
                System.out.println("请输入三角形的三条边a、b、c：");
                a= input.nextDouble();
                b= input.nextDouble();
                c= input.nextDouble();
                if (a<0||b<0||c<0||a+b<=c||a-b>=c) {
                    System.out.print("输入错误!!!");
                }
            } while ((a<0||b<0||c<0||a+b<=c||a-b>=c));
            do {
                System.out.println("请输入矩形的长和宽height、width：");
                height= input.nextDouble();
                width= input.nextDouble();
                if (height<=0||width<=0) {
                    System.out.print("输入错误!!!");
                }
            } while (height<=0||width<=0);
            Circle C=new Circle(r);
            Triangle T=new Triangle(a,b,c);
            Rentangle R=new Rentangle(height,width);
            System.out.println("******圆*******");
            System.out.println("半径: " + C.getR());
            System.out.println("面积 : " + C.getArea());
            System.out.println("周长 : " + C.getCircumference());
            System.out.println("*******三角形*******");
            System.out.println("三边为: " + T.getA()+","+T.getB()+","+T.getC());
            System.out.println("面积 : " + T.getArea());
            System.out.println("周长 : " + T.getCircumference());
            System.out.println("*******矩形*******");
            System.out.println("长: " + R.getHeight());
            System.out.println("宽: " + R.getWidth());
            System.out.println("面积 : " + R.getArea());
            System.out.println("周长 : " + R.getCircumference());
        }
    }

