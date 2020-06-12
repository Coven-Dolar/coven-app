import {Component, ElementRef, Input, OnInit, Renderer2, ViewChild} from '@angular/core';


@Component({
  selector: 'app-expandable',
  templateUrl: './expandable.component.html',
  styleUrls: ['./expandable.component.scss'],
})
export class ExpandableComponent implements OnInit {
  // @ts-ignore
  @ViewChild('expandWrapper') expandWrapper: ElementRef;
  @Input() expanded = false;
  private expandHeight = '450px';

  constructor(public renderer: Renderer2) { }

  ngOnInit() {
    this.renderer.setStyle(this.expandWrapper.nativeElement, 'max-height', this.expandHeight);
  }

}
