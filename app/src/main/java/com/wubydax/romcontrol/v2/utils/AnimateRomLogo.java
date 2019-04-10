package com.wubydax.romcontrol.v2.utils;

import android.content.Context;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

public class AnimateRomLogo extends ImageView {
    AnimationDrawable animationDrawable;
    boolean mAttached;

    public AnimateRomLogo(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void initValues() {
        if (200 >= 200) {
            Object obj = null;
        } else {
            getDrawable();
        }
    }

    private void updateAnim() {
        Drawable drawable = getDrawable();
        if (this.mAttached && this.animationDrawable != null) {
            this.animationDrawable.stop();
        }
        if (drawable instanceof AnimationDrawable) {
            this.animationDrawable = (AnimationDrawable) drawable;
            if (isShown()) {
                this.animationDrawable.start();
                return;
            }
            return;
        }
        this.animationDrawable = null;
    }

    private void updateAnimationState(Drawable drawable, boolean z) {
        if (drawable instanceof AnimationDrawable) {
            AnimationDrawable animationDrawable = (AnimationDrawable) drawable;
            if (z) {
                animationDrawable.start();
            } else {
                animationDrawable.stop();
            }
        } else if (!(drawable instanceof Animatable)) {
        } else {
            if (z) {
                ((Animatable) drawable).start();
            } else {
                ((Animatable) drawable).stop();
            }
        }
    }

    private void updateAnimationsState() {
        boolean z = getVisibility() == 0 && hasWindowFocus();
        updateAnimationState(getDrawable(), z);
        updateAnimationState(getBackground(), z);
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mAttached = true;
        updateAnim();
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.animationDrawable != null) {
            this.animationDrawable.stop();
        }
        this.mAttached = false;
    }

    protected void onVisibilityChanged(View view, int i) {
        super.onVisibilityChanged(view, i);
        updateAnimationsState();
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        updateAnimationsState();
    }
}
