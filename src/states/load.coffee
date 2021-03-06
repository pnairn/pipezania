sizzle    = null
titlecard = null

fadein = =>
  if _d.get_sound()
    sizzle.fadeIn(200)
  tween = game.add.tween titlecard
  tween.to { alpha: 1 }, 750 , Phaser.Easing.Linear.None
  tween.to { alpha: 1 }, 3500, Phaser.Easing.Linear.None
  tween.onComplete.add fadeout, this
  tween.start()
fadeout = =>
  if _d.get_sound()
    sizzle.fadeOut(800)
  tween = game.add.tween titlecard
  tween.to { alpha: 0 }, 1000 , Phaser.Easing.Linear.None
  tween.onComplete.add complete, this
  tween.start()
fadeout_card = =>

complete = ->
  game.state.start 'menu'

_states.load =
  preload: ->

    game.load.audio 'sizzle'   , './sizzle.mp3'
    game.load.image 'titlecard', './titlecard.png'

    game.load.audio 'win' , './win.mp3'
    game.load.audio 'fail', './fail.mp3'

    game.load.audio 'sparkle' , './sparkle.mp3'
    game.load.audio 'bubbles' , './bubbles.mp3'

    game.load.audio 'turn1' , './turn1.mp3'
    game.load.audio 'turn2' , './turn2.mp3'
    game.load.audio 'turn3' , './turn3.mp3'
    game.load.audio 'turn4' , './turn4.mp3'

    game.load.image 'back_button'    , './back.png'
    game.load.image 'label_adventure', './label_adventure.png'
    game.load.image 'label_time'     , './label_time.png'

    game.load.image 'tab', './tab.png'

    game.load.image 'bg1', './bg1.png'
    game.load.image 'bg2', './bg2.png'
    game.load.image 'bg3', './bg3.png'
    game.load.image 'bg4', './bg4.png'
    game.load.image 'bg5', './bg5.png'

    game.load.image       'button_adventure', './button_adventure.png'
    game.load.image       'button_time'     , './button_time.png'

    game.load.spritesheet 'button_flow'  , './button_flow.png'  , 128, 64 , 2
    game.load.spritesheet 'jewels'      , './jewels.png'      , 28 , 28 , 4
    game.load.spritesheet 'jewels_large', './jewels_large.png', 100, 100, 4

    game.load.spritesheet 'audio_buttons', './audio_buttons.png', 48 , 48 , 4
    game.load.spritesheet 'levels'       , './levels.png'       , 128, 96 , 6
    game.load.spritesheet 'pipes'        , './pipes.png'        , 64 , 64 , 6
    game.load.spritesheet 'clear_buttons', './clear_buttons.png', 64 , 64 , 9
    game.load.image       'tile'         , './tile.png'
    game.load.image       'clear_screen' , './clear_screen.png'

    game.load.image 'menu' , './menu.png'
    game.load.image 'logo' , './logo.png'

    game.load.image 'jewel_med', './jewel_med.png'
    game.load.image 'star_med' , './star_med.png'
  create: ->
    _d.load()
    titlecard = game.add.image 0, 0, 'titlecard'
    titlecard.alpha = 0

    if window.editor != false
      _d.level = window.editor
      game.state.start 'play'
    else
      sizzle = game.add.audio 'sizzle'
      if _d.get_sound()
        sizzle.onDecoded.add fadein, this
      else
        fadein()
