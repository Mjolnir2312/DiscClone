using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObstacleEffect : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField] private ParticleSystem _breakEffect;
    //[SerializeField] private AudioClip _breakSound;

    //private AudioSource audioSource;

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Disc"))
        {
            Instantiate(_breakEffect, transform.position, transform.rotation);
            //audioSource.PlayOneShot(_breakSound);
            Destroy(gameObject);
        }
    }
}
