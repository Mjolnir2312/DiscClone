using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAnimation : MonoBehaviour
{
    private const string isFlaling = "isFlaling";
    private const string isThrow = "isThrow";
    private const string onRight = "onRight";
    private const string onLeft = "onLeft";
    private const string onForward = "onForward";
    private const string onBack = "onBack";

    private Animator _animator = null;

    // Start is called before the first frame update
    void Start()
    {
        _animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void StartOnLeftAnimation()
    {
        ResetAllState();

        _animator.SetBool(onLeft, true);
    }

    public void StartOnRightAnimation()
    {
        ResetAllState();

        _animator.SetBool(onRight, true);
    }

    public void StartOnForwardAnimation()
    {
        ResetAllState();

        _animator.SetBool(onForward, true);
    }

    public void StartOnBackAnimation()
    {
        ResetAllState();

        _animator.SetBool(onBack, true);
    }


    public void StartFlalingAnimation()
    {
        ResetAllState();

        _animator.SetBool(isFlaling, true);
    }    

    public void StartThrowAnimation()
    {
        ResetAllState();

        _animator.SetBool(isThrow, true);
    }

    public void ResetAllState()
    {
        _animator.SetBool(isFlaling, false);
        _animator.SetBool(isThrow, false);
        _animator.SetBool(onRight, false);
        _animator.SetBool(onLeft, false);
        _animator.SetBool(onForward, false);
        _animator.SetBool(onBack, false);
    }

    public void DisableAnimator()
    {
        _animator.enabled = false;
    }
}
