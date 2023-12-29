\version "2.20.0"
%All notation in one line
%Make sure whatever last note has an extra note for full duration
%meter will have extra beat
%paper width and line width will be number of beats (+extra beat) * 50
%Resize in Inkscape to 50px per beat - minus the extra beat
%zoom 210% should be 105 px per beat


\paper
{
  paper-width = 1800 %50px per beat +1 for last beat marking border 
  paper-height = 100

  top-margin = 0
  bottom-margin = 0
  left-margin = 0
  right-margin = 0
  
  system-system-spacing =
  #'((basic-distance . 15)  %this controls space between lines default = 12
                            (minimum-distance . 8)
                            (padding . 1)
                            (stretchability . 60)) 
}


\book
{

  \header
  {
    tagline = ##f %Do not display tagline
  }

  \score
  {
    <<

      \override Score.BarNumber.break-visibility = ##(#f #f #f) %The order of the three values is end of line visible, middle of line visible, beginning of line visible.
     
     
      
     
      \new Staff \with 
      {
        \omit TimeSignature
        \omit BarLine
        \omit Clef
        \omit KeySignature
        \override StaffSymbol.thickness = #1 %thickness of stafflines, ledger lines, and stems
        % \accidentalStyle dodecaphonic  modern modern-cautionary neo-modern default http://lilypond.org/doc/v2.18/Documentation/notation/displaying-pitches#automatic-accidentals
      }

      {
        \override TupletBracket.bracket-visibility = ##t
        \override TupletBracket.padding = 3
        \override TupletNumber.visibility = ##f
        \set tupletFullLength = ##t %http://lilypond.org/doc/v2.19/Documentation/snippets/rhythms
        \override NoteHead.font-size = #-2
        \override DynamicText.font-size = #-2
        \override Stem.details.beamed-lengths = #'(7)
        \override Stem.details.lengths = #'(7)
        % \override NoteColumn.accent-skip = ##t
        \override Accidental.font-size = -2 
        \override Stem.direction = #up
        \stopStaff % Hides staff lines
        \set Score.tempoHideNote = ##t
        %\override Stem.transparent = ##t 
        \override Score.Script.font-size = #-2 %change articulation font size
        
        
        %%%%%%% SCORE BEGINS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        \tempo 4 = 60
        \time 36/4
        
        
        
        
        \override Beam.grow-direction = #RIGHT
        \featherDurations #(ly:make-moment 4/5) { e'16 [ e' e' e' e' e' e' e' e' e' e' e'  ] } %3 beats accel
        
        r4 r4
        
          \grace  {  
          \override NoteHead.font-size = #-8
          [ e''32  <d'' f''>  <c'' e'' g''>   <b' d'' f'' a''>    <a' c'' e'' g'' b''>      <b' d'' f'' a''>    <c'' e'' g''>   <d'' f''>   e''   ] 
        }
        \override NoteHead.font-size = #-2
        \once \override Stem.direction = #down
        e''8 -^  r8
       
         
        \override Beam.grow-direction = #LEFT
        \featherDurations #(ly:make-moment 5/4 ) { e'16 [ e' e' e' e' e' e'e' ] } %2 beats DECEL
        \override Beam.grow-direction = #'()

       
       r4 r4
       
        \once \override TupletNumber #'text = "5:1"
        \tuplet 5/4 {[ r16 b' e'' f' c' ]}
       
       
        
        \override Beam.grow-direction = #RIGHT
        \featherDurations #(ly:make-moment 3/4) { e'16 [ e' e' e' e' e' e' e' e' e' e' e' e' e' e' e' ] } %4 beats accel
      
       
        %extra note for right border in Inkscape/SVG
        \once \override Stem.direction = #down
        g''4 
        %%%%% END SCORE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
        
      }

    >>


    \layout
    {
      \context
      {
        \Score
        proportionalNotationDuration = #(ly:make-moment 1/35) 
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.strict-note-spacing = ##t
        % \override SpacingSpanner.strict-grace-spacing = ##t
        \override Beam.breakable = ##t
        \override Glissando.breakable = ##t
        \override TextSpanner.breakable = ##t
        % \override NoteHead.no-ledgers = ##t 
      }

      indent = 0
      line-width = 1800 %50px per beat +1 for last beat marking border
      #(layout-set-staff-size 33) %staff height
      % \hide Stem
      %\hide NoteHead
      % \hide LedgerLineSpanner
      % \hide TupletNumber 
    }

    \midi{}

  }
}

