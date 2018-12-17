class SoundFile {
  constructor(sketch, fileName) {
    this.audio = document.createElement('audio');
    this.audio.setAttribute('src', 'data/' + fileName);
    this.audio.addEventListener('loadeddata', function() {
      this.ready = true;

      if (this.waiting) {
        this.play();
      }
    }.bind(this));

    document.body.appendChild(this.audio);
  }

  play() {
    if (this.ready) {
      this.audio.play();
    }
    else {
      this.waiting = true;
    }
  }

  stop() {
    this.audio.pause();
    this.audio.currentTime = 0;
  }

  loop() {
    this.audio.setAttribute('loop', true);
  }
}
