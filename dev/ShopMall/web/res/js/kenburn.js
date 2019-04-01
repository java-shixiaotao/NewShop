// VEGAS
// Background SLideShow
// Codepen Demo
// http://vegas.jatysalvat.com



$('.kenbarn').vegas({
  overlay: true,
  transition: 'fade', 
  transitionDuration: 4000,
  delay: 10000,
  animation: 'random',
  animationDuration: 20000,
  slides: [
    { src: 'res/images/slider/kenburn-1.jpg' },
    { src: 'res/images/slider/kenburn-2.jpg' },
    { src: 'res/images/slider/kenburn-3.jpg' },
	{ src: 'res/images/slider/kenburn-4.jpg' },
	{ src: 'res/images/slider/kenburn-5.jpg' },
	{ src: 'res/images/slider/kenburn-6.jpg' },
	{ src: 'res/images/slider/kenburn-7.jpg' },
    /*{ src: 'images/slider/kenburn-4.jpg' }*/
  ]
});