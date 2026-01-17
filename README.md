# CyberPatch

A game made for [Patch Notes v1.1](https://itch.io/jam/patch-notes) game jam.

# Game Design Doc

### 1.1 Elevator Pitch

A 2D cyberpunk platformer puzzle game that alternates between platforming and puzzle solving repeatedly. You are always against the clock, if the clock reaches 0, you lose.

### 1.2 Summary

- Global Countdown – a single timer that runs while you’re on the hub. It represents the city’s power grid about to shut down.,
- City  – a side‑scrolling “street” map, with platforming
 	- Completing the city level puts you into an underground level,
- Underground - an underground non scrolling map that has a puzzle
 	- pauses the global timer but introduces its own local timer (n seconds).
 	- When the local timer expires you respawn at the entry point for underground, resets puzzle, and lose n seconds from the global pool.,
 	- Solving puzzle puts you into another city level

### 1.3 Jam Theme

![[Pasted image 20260116111243.png]]

### 1.4 Player Experience

Yes

### 1.5 Platform

Web (itch.io)

### 1.6 Development Software

Godot

### 1.7 Genre

2D Platformer/Puzzle

### 1.8 Target Audience

Yes

## 2. Concept

---

### 2.1 Gameplay Overview

Game switches between being a fast-paced speedrunners-style platformer, to a more methodical puzzle game.

### 2.2 Theme Interpretation/Immersive Gameplay

### 2.3 Primary Mechanics

- Overworld/Underworld switching (Automatic on level change)
- Overworld timer dictates all gameplay
- Overworld:
 	- Grapple Hook?
- Underworld:
 	- Rewind? (Braid style)
 	- Gravity? (VVVVVV style)

### 2.4 Secondary Mechanics

- Grab powerups/bonuses for the opposite world
- Want overworld mechanics to affect underworld and vice versa

## 3. Game Structure

---

### 3.1 Primary Gameplay Loop

#### Overworld

2D 'Speedrunners-style' Platformer where the side scrolling is automatic, must keep up with the world and avoid obstacles to make it to the next level

#### Underworld

2D 'Braid-style' Platformer where you must solve puzzles. Getting them incorrect or failing to complete them in time forces a 'do-over' of the level and penalizes the 'Global Timer'

### 3.2 Level Layout/Design

### 3.3 Progression System

### 3.4 Combat/Engagement System

### 3.5 Resource System

### 3.6 Extraneous Systems

## 4. UI/UX

---

### 4.1 HUD

- Global timer system

### 4.2 Menus

#### Main Menu

- Start
- Options
- Exit

#### Pause Menu

- Resume
- Exit

### 4.3 Visual Clarity/Feedback

## 5. Technical Architecture

---

### 5.1 Core Systems

#### 5.1.1 Data Architecture

#### 5.1.2 Component Structure

### 5.2 Input Handling

#### 5.2.1 Input Framework

#### 5.2.2 Control Scheme

### 5.3 AI/NPC Behavior

## 6. Art/Audio/Assets

---

### 6.1 Art

#### 6.1.1 Style

2D-Pixel
Palette
cyberpunk like tbd <https://lospec.com/>,
<https://lospec.com/palette-list/shido-cyberneon>

#### 6.1.2 Environment Art

##### Backgrounds

- rooftops
- buildings
- districts and megastructures

##### Tiles

- For city levels:
 	- metal grates,
 	- buildings,
 	- streets,
 	- windows,
- For underground levels:
 	- pipes,
 	- more gritty stuff idk

#### 6.1.3 Character Design

Cyberpunk Cyborg?

#### 6.1.4 Effects

### 6.2 Audio

#### 6.2.1 Music

EDM bb (Strudel/TidalWave?)
Trance?/Bass?

#### 6.2.2 Sound Effects

- Jump
- Wall/Floor touch
- Power up/Bonus pickups

### 6.3 Other Assets

## 7. Testing/Balance

---

### 7.1 Testing Plan

### 7.2 Testing Methodology

### 7.3 Difficulty Scaling
